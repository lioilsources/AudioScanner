import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../analysis/response_analysis.dart';
import '../app_state.dart';
import '../dsp/distortion.dart';
import '../dsp/impulse_response.dart';
import '../export/frd.dart';
import '../signal/log_sweep.dart';
import '../store/session_store.dart';
import '../analysis/decay_analysis.dart';
import 'compare_screen.dart';
import 'widgets/response_chart.dart';
import 'widgets/spectrogram_view.dart';
import 'widgets/time_chart.dart';
import '../dsp/spectrogram.dart';
import '../l10n/l10n.dart';

/// Phase 3: record a sweep, deconvolve it, read the room's timing.
///
/// The flow has one rule that cannot be softened — start recording *before*
/// starting playback. The deconvolution needs the whole sweep; a recording that
/// begins halfway through produces an impulse response that looks perfectly
/// reasonable and is wrong.
class ImpulseScreen extends StatefulWidget {
  const ImpulseScreen({super.key, required this.state, this.store});

  final AppState state;
  final SessionStore? store;

  @override
  State<ImpulseScreen> createState() => _ImpulseScreenState();
}

class _ImpulseScreenState extends State<ImpulseScreen> {
  double _seconds = 10;
  // Fixed for now: the band matters less than the length, and a mismatch
  // with the file actually being played is the one error that silently
  // produces a plausible-looking wrong answer.
  final double _startHz = 20;
  final double _endHz = 20000;

  /// Gate length in milliseconds. Slider works in log space so 2–20 ms gets
  /// as much travel as 50–500: the short end is where the choice matters.
  double _gateMs = 5;
  int _smoothing = 6;

  ResponseAnalysis? _analysis;

  LogSweep get _sweep => LogSweep(
        startHz: _startHz,
        endHz: _endHz,
        duration: Duration(milliseconds: (_seconds * 1000).round()),
        sampleRate: widget.state.captureStatus?.sampleRate ?? 48000,
      );

  Duration get _gate => Duration(microseconds: (_gateMs * 1000).round());

  ResponseAnalysis _analysisFor(ImpulseResponse ir) {
    final current = _analysis;
    if (current != null && current.matches(ir, _gate)) return current;
    return _analysis = ResponseAnalysis.of(ir, gate: _gate);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.state,
      builder: (context, _) {
        final s = widget.state;
        final ir = s.impulseResponse;
        final l = context.l10n;

        return Scaffold(
          appBar: AppBar(
            title: Text(l.impulseTitle),
            actions: [
              if (widget.store != null || (s.session?.points.length ?? 0) >= 2)
                IconButton(
                  icon: const Icon(Icons.compare_arrows),
                  tooltip: l.impulseCompareTooltip,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => CompareScreen(state: s, store: widget.store),
                    ),
                  ),
                ),
              if (ir != null)
                IconButton(
                  icon: const Icon(Icons.ios_share),
                  tooltip: l.impulseExportTooltip,
                  onPressed: () => _exportFrd(_analysisFor(ir)),
                ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (!s.listening)
                Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: ListTile(
                    leading: const Icon(Icons.mic_off),
                    title: Text(l.commonMicNotRunning),
                    subtitle: Text(s.error ?? l.impulseTapToStart),
                    onTap: s.startListening,
                  ),
                ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.impulseSweepTitle,
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        l.impulseSweepHelp(_startHz.round(), _endHz.round(),
                            _seconds.round()),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Slider(
                        value: _seconds,
                        min: 3,
                        max: 30,
                        divisions: 27,
                        label: '${_seconds.round()} s',
                        onChanged: s.recordingSweep
                            ? null
                            : (v) => setState(() => _seconds = v),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (s.recordingSweep)
                Card(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: ListTile(
                    leading: const Icon(Icons.fiber_manual_record),
                    title: Text(
                        l.impulseRecording(s.recordedSeconds.toStringAsFixed(1))),
                    subtitle: Text(l.impulsePlaySweepNow),
                    trailing: FilledButton(
                      onPressed: () => s.finishSweepRecording(_sweep),
                      child: Text(l.commonDone),
                    ),
                  ),
                )
              else
                FilledButton.icon(
                  onPressed: s.listening ? s.startSweepRecording : null,
                  icon: const Icon(Icons.fiber_manual_record),
                  label: Text(l.impulseStartRecording),
                ),
              const SizedBox(height: 16),
              if (ir != null) ...[
                _ResponseCard(
                  analysis: _analysisFor(ir),
                  correct: (levels) => s.correctionContext
                      .correctedCurve(_analysisFor(ir).frequencies, levels),
                  gateMs: _gateMs,
                  smoothing: _smoothing,
                  onGateChanged: (ms) => setState(() => _gateMs = ms),
                  onSmoothingChanged: (f) => setState(() => _smoothing = f),
                ),
                const SizedBox(height: 12),
                _TimeCard(ir: ir, gate: _gate),
                const SizedBox(height: 12),
                _Results(ir: ir, gate: _gate, distortion: s.distortion),
                const SizedBox(height: 12),
                _BandTable(decay: s.decayAnalysis),
                const SizedBox(height: 12),
                _SpectrogramCard(ir: ir),
              ],
            ],
          ),
        );
      },
    );
  }

  Future<void> _exportFrd(ResponseAnalysis a) async {
    final store = widget.store;
    if (store == null) return;

    final text = FrdExport.fromImpulseResponse(
      frequencies: a.frequencies,
      magnitudesDb:
          widget.state.correctionContext.correctedCurve(a.frequencies, a.gatedDb),
      phasesDeg: FrdExport.phaseDegrees(a.gatedRe, a.gatedIm),
      session: widget.state.session,
      validAbove: a.validAbove,
      phaseNote: 'Phase is relative to the direct sound (propagation delay '
          'removed), unwrapped.',
    );
    final f = await store.writeExport('impulse_gated.frd', text);
    await SharePlus.instance
        .share(ShareParams(files: [XFile(f.path)], subject: 'Gated FRD'));
  }
}

/// Frequency response of the gated and the full response, with the controls
/// that decide what "gated" means.
class _ResponseCard extends StatelessWidget {
  const _ResponseCard({
    required this.analysis,
    required this.correct,
    required this.gateMs,
    required this.smoothing,
    required this.onGateChanged,
    required this.onSmoothingChanged,
  });

  final ResponseAnalysis analysis;

  /// Applies the session's microphone correction to a curve for display.
  final List<double> Function(List<double>) correct;
  final double gateMs;
  final int smoothing;
  final ValueChanged<double> onGateChanged;
  final ValueChanged<int> onSmoothingChanged;

  static const _minGateMs = 2.0;
  static const _maxGateMs = 500.0;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final ir = analysis.source;
    final reflection = ir.firstReflectionIndex();
    final toReflectionMs = reflection == null
        ? null
        : (reflection - ir.directSoundIndex) / ir.sampleRate * 1000 - 0.5;
    final l = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.impulseFrequencyResponse, style: t.textTheme.titleMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: ResponseChart(
                curves: [
                  ResponseCurve(
                    frequencies: analysis.frequencies,
                    levelsDb: correct(analysis.roomSmoothed(smoothing)),
                    label: l.impulseWithRoom,
                    color: t.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                    strokeWidth: 1.5,
                  ),
                  ResponseCurve(
                    frequencies: analysis.frequencies,
                    levelsDb: correct(analysis.gatedSmoothed(smoothing)),
                    label: l.impulseDirectWindow(gateMs.toStringAsFixed(gateMs < 10 ? 1 : 0)),
                    color: t.colorScheme.primary,
                  ),
                ],
                validAbove: analysis.validAbove,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(l.impulseWindow, style: t.textTheme.bodyMedium),
                Expanded(
                  child: Slider(
                    value: math.log(gateMs.clamp(_minGateMs, _maxGateMs)),
                    min: math.log(_minGateMs),
                    max: math.log(_maxGateMs),
                    label: '${gateMs.toStringAsFixed(gateMs < 10 ? 1 : 0)} ms',
                    onChanged: (v) => onGateChanged(
                        double.parse(math.exp(v).toStringAsFixed(1))),
                  ),
                ),
                Text('${gateMs.toStringAsFixed(gateMs < 10 ? 1 : 0)} ms',
                    style: t.textTheme.bodyMedium),
              ],
            ),
            Text(
              l.impulseWindowHelp(analysis.validAbove.toStringAsFixed(0)),
              style: t.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (toReflectionMs != null && toReflectionMs >= _minGateMs)
                  OutlinedButton(
                    onPressed: () => onGateChanged(
                        double.parse(toReflectionMs.toStringAsFixed(1))),
                    child: Text(
                        l.impulseToFirstReflection(toReflectionMs.toStringAsFixed(1))),
                  ),
                SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(value: 3, label: Text('1/3')),
                    ButtonSegment(value: 6, label: Text('1/6')),
                    ButtonSegment(value: 12, label: Text('1/12')),
                    ButtonSegment(value: 24, label: Text('1/24')),
                  ],
                  selected: {smoothing},
                  showSelectedIcon: false,
                  onSelectionChanged: (s) => onSmoothingChanged(s.first),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Impulse or energy-time curve, with the gate and the first reflection
/// marked on it.
class _TimeCard extends StatefulWidget {
  const _TimeCard({required this.ir, required this.gate});

  final ImpulseResponse ir;
  final Duration gate;

  @override
  State<_TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<_TimeCard> {
  bool _etc = true;
  double _spanMs = 100;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.impulseTime, style: t.textTheme.titleMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: TimeChart(
                ir: widget.ir,
                gate: widget.gate,
                etc: _etc,
                spanMs: _spanMs,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                SegmentedButton<bool>(
                  segments: [
                    const ButtonSegment(value: true, label: Text('ETC (dB)')),
                    ButtonSegment(value: false, label: Text(context.l10n.impulseImpulse)),
                  ],
                  selected: {_etc},
                  showSelectedIcon: false,
                  onSelectionChanged: (v) => setState(() => _etc = v.first),
                ),
                SegmentedButton<double>(
                  segments: const [
                    ButtonSegment(value: 20, label: Text('20 ms')),
                    ButtonSegment(value: 100, label: Text('100 ms')),
                    ButtonSegment(value: 500, label: Text('500 ms')),
                  ],
                  selected: {_spanMs},
                  showSelectedIcon: false,
                  onSelectionChanged: (v) => setState(() => _spanMs = v.first),
                ),
              ],
            ),
            Text(
              context.l10n.impulseTimeHelp,
              style: t.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// Which frequencies ring on, shown rather than tabulated.
class _SpectrogramCard extends StatefulWidget {
  const _SpectrogramCard({required this.ir});

  final ImpulseResponse ir;

  @override
  State<_SpectrogramCard> createState() => _SpectrogramCardState();
}

class _SpectrogramCardState extends State<_SpectrogramCard> {
  Spectrogram? _spectrogram;
  ImpulseResponse? _of;
  bool _open = false;

  Spectrogram _get() {
    if (_spectrogram != null && identical(_of, widget.ir)) return _spectrogram!;
    _of = widget.ir;
    return _spectrogram = Spectrogram.of(widget.ir);
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.impulseSpectrogram, style: t.textTheme.titleMedium),
                TextButton(
                  onPressed: () => setState(() => _open = !_open),
                  child: Text(_open ? context.l10n.commonHide : context.l10n.commonShow),
                ),
              ],
            ),
            if (_open) ...[
              SizedBox(height: 200, child: SpectrogramView(spectrogram: _get())),
              const SizedBox(height: 6),
              Text(
                context.l10n.impulseSpectrogramHelp,
                style: t.textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// EDT, T20, T30, C50 per octave.
class _BandTable extends StatelessWidget {
  const _BandTable({required this.decay});

  final DecayAnalysis? decay;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final d = decay;
    if (d == null) return const SizedBox.shrink();
    String sec(Duration? v) =>
        v == null ? '—' : (v.inMilliseconds / 1000).toStringAsFixed(2);
    String db(double? v) => v == null ? '—' : v.toStringAsFixed(1);
    String hz(double v) => v >= 1000 ? '${(v / 1000).round()}k' : v.round().toString();
    final mid = d.midBandRt60Seconds;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.impulseDecayByOctave, style: t.textTheme.titleMedium),
            const SizedBox(height: 8),
            Table(
              columnWidths: const {0: FixedColumnWidth(48)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  for (final h in ['Hz', 'EDT', 'T20', 'T30', 'C50'])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(h,
                          textAlign: TextAlign.end,
                          style: t.textTheme.labelSmall),
                    ),
                ]),
                for (final b in d.bands)
                  TableRow(children: [
                    for (final cell in [
                      hz(b.centerHz),
                      sec(b.edt),
                      sec(b.t20),
                      sec(b.t30),
                      db(b.c50Db),
                    ])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(cell,
                            textAlign: TextAlign.end,
                            style: t.textTheme.bodySmall),
                      ),
                  ]),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${mid == null ? context.l10n.impulseMidNoT20 : context.l10n.impulseMidT20(mid.toStringAsFixed(2))} '
              '${context.l10n.impulseDecayHelp}',
              style: t.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({
    required this.ir,
    required this.gate,
    this.distortion = const [],
  });

  final ImpulseResponse ir;
  final Duration gate;
  final List<HarmonicLevel> distortion;

  /// Above this the take was too hot or the speaker is at its limit — and a
  /// distortion tail looks exactly like a reflection in the impulse.
  static const _hotDb = -30.0;

  @override
  Widget build(BuildContext context) {
    final rt20 = ir.rt60(decayDb: 20);
    final rt30 = ir.rt60(decayDb: 30);
    final reflection = ir.firstReflectionIndex();
    final gated = ir.gated(window: gate);

    String ms(int samples) =>
        '${(samples / ir.sampleRate * 1000).toStringAsFixed(1)} ms';
    final l = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.impulseResult, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _Row(l.impulseDirectArrived, ms(ir.directSoundIndex),
                l.impulseDirectArrivedHelp),
            _Row(
              l.impulseFirstReflection,
              reflection == null
                  ? l.impulseNotFound
                  : l.impulseAfterDirect(ms(reflection - ir.directSoundIndex)),
              reflection == null
                  ? l.impulseNoReflectionHelp
                  : l.impulseExtraPath(((reflection - ir.directSoundIndex) /
                          ir.sampleRate *
                          343)
                      .toStringAsFixed(2)),
            ),
            _Row(
              'RT60',
              rt20 == null
                  ? l.impulseUnmeasurable
                  : '${(rt20.inMilliseconds / 1000).toStringAsFixed(2)} s (T20)'
                      '${rt30 == null ? "" : " · ${(rt30.inMilliseconds / 1000).toStringAsFixed(2)} s (T30)"}',
              rt20 == null ? l.impulseRt60NoiseHelp : l.impulseRt60Help,
            ),
            _Row(
              l.impulseGating,
              l.impulseValidAbove(
                  gated.gatedResponseValidAbove.toStringAsFixed(0)),
              l.impulseGatingHelp,
            ),
            if (distortion.isNotEmpty) ..._distortionRows(context),
            const SizedBox(height: 12),
            SizedBox(height: 120, child: _DecayChart(ir: ir)),
            Text(l.impulseSchroeder,
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

extension on _Results {
  List<Widget> _distortionRows(BuildContext context) {
    String fmt(double v) => v.isNaN ? '—' : '${v.toStringAsFixed(0)} dB';
    final rows = <Widget>[];
    final l = context.l10n;
    var worst = -160.0;
    for (final h in distortion) {
      final at100 = h.at(100);
      final at1k = h.at(1000);
      for (final v in [at100, at1k]) {
        if (!v.isNaN && v > worst) worst = v;
      }
      rows.add(_Row(
        l.impulseHdAt(h.order),
        '${fmt(at100)} / ${fmt(at1k)}',
        h.order == 2 ? l.impulseHd2Help : l.impulseHd3Help,
      ));
    }
    if (worst > _Results._hotDb) {
      rows.add(Card(
        color: Theme.of(context).colorScheme.errorContainer,
        child: ListTile(
          leading: const Icon(Icons.warning_amber),
          title: Text(l.impulseDistortionHot),
          subtitle: Text(l.impulseDistortionHotHelp),
        ),
      ));
    }
    return rows;
  }
}

class _Row extends StatelessWidget {
  const _Row(this.label, this.value, this.note);

  final String label;
  final String value;
  final String note;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: t.textTheme.bodyMedium),
              Text(value,
                  style: t.textTheme.titleSmall
                      ?.copyWith(color: t.colorScheme.primary)),
            ],
          ),
          Text(note, style: t.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _DecayChart extends StatelessWidget {
  const _DecayChart({required this.ir});

  final ImpulseResponse ir;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _DecayPainter(
          curve: ir.schroederCurveDb(),
          scheme: Theme.of(context).colorScheme,
        ),
        child: const SizedBox.expand(),
      );
}

class _DecayPainter extends CustomPainter {
  _DecayPainter({required this.curve, required this.scheme});

  final List<double> curve;
  final ColorScheme scheme;

  @override
  void paint(Canvas canvas, Size size) {
    if (curve.isEmpty) return;
    const floor = -70.0;

    // The −5 and −25 dB lines are the T20 evaluation range; drawing them makes
    // it visible whether the fit had a straight decay to work with.
    final guide = Paint()
      ..color = scheme.outlineVariant
      ..strokeWidth = 1;
    for (final db in [-5.0, -25.0]) {
      final y = (db / floor).clamp(0.0, 1.0) * size.height;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), guide);
    }

    final path = Path();
    final step = math.max(1, curve.length ~/ size.width.round().clamp(1, 4096));
    var started = false;
    for (var i = 0; i < curve.length; i += step) {
      final x = i / curve.length * size.width;
      final y = (curve[i] / floor).clamp(0.0, 1.0) * size.height;
      if (!started) {
        path.moveTo(x, y);
        started = true;
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = scheme.primary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(_DecayPainter old) => old.curve != curve;
}
