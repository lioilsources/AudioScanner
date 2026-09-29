import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../analysis/response_analysis.dart';
import '../app_state.dart';
import '../dsp/impulse_response.dart';
import '../export/frd.dart';
import '../signal/log_sweep.dart';
import '../store/session_store.dart';
import '../analysis/decay_analysis.dart';
import 'compare_screen.dart';
import 'widgets/response_chart.dart';
import 'widgets/time_chart.dart';

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

        return Scaffold(
          appBar: AppBar(
            title: const Text('Impulzní odezva'),
            actions: [
              if ((s.session?.points.length ?? 0) >= 2)
                IconButton(
                  icon: const Icon(Icons.compare_arrows),
                  tooltip: 'Srovnat body',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => CompareScreen(state: s),
                    ),
                  ),
                ),
              if (ir != null)
                IconButton(
                  icon: const Icon(Icons.ios_share),
                  tooltip: 'Export FRD s fází',
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
                    title: const Text('Mikrofon neběží'),
                    onTap: s.startListening,
                  ),
                ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sweep, který pustíš do beden',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        '${_startHz.round()} – ${_endHz.round()} Hz, '
                        '${_seconds.round()} s. Musí sedět s tím, co přehráváš '
                        '— jinak dekonvoluce vrátí nesmysl.',
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
                        'Nahrávám — ${s.recordedSeconds.toStringAsFixed(1)} s'),
                    subtitle: const Text('Teď pusť sweep z počítače.'),
                    trailing: FilledButton(
                      onPressed: () => s.finishSweepRecording(_sweep),
                      child: const Text('Hotovo'),
                    ),
                  ),
                )
              else
                FilledButton.icon(
                  onPressed: s.listening ? s.startSweepRecording : null,
                  icon: const Icon(Icons.fiber_manual_record),
                  label: const Text('Začít nahrávat, pak pustit sweep'),
                ),
              const SizedBox(height: 16),
              if (ir != null) ...[
                _ResponseCard(
                  analysis: _analysisFor(ir),
                  gateMs: _gateMs,
                  smoothing: _smoothing,
                  onGateChanged: (ms) => setState(() => _gateMs = ms),
                  onSmoothingChanged: (f) => setState(() => _smoothing = f),
                ),
                const SizedBox(height: 12),
                _TimeCard(ir: ir, gate: _gate),
                const SizedBox(height: 12),
                _Results(ir: ir, gate: _gate),
                const SizedBox(height: 12),
                _BandTable(decay: s.decayAnalysis),
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
      magnitudesDb: a.gatedDb,
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
    required this.gateMs,
    required this.smoothing,
    required this.onGateChanged,
    required this.onSmoothingChanged,
  });

  final ResponseAnalysis analysis;
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Frekvenční odezva', style: t.textTheme.titleMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: ResponseChart(
                curves: [
                  ResponseCurve(
                    frequencies: analysis.frequencies,
                    levelsDb: analysis.roomSmoothed(smoothing),
                    label: 's místností (1 s)',
                    color: t.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                    strokeWidth: 1.5,
                  ),
                  ResponseCurve(
                    frequencies: analysis.frequencies,
                    levelsDb: analysis.gatedSmoothed(smoothing),
                    label: 'přímý zvuk (okno ${gateMs.toStringAsFixed(gateMs < 10 ? 1 : 0)} ms)',
                    color: t.colorScheme.primary,
                  ),
                ],
                validAbove: analysis.validAbove,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Okno', style: t.textTheme.bodyMedium),
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
              'Delší okno vidí níž (teď platné nad '
              '${analysis.validAbove.toStringAsFixed(0)} Hz), ale pustí dovnitř '
              'první odraz. Pod hranicí se křivka nevyhlazuje ani nekomentuje: '
              'je to okno, ne místnost.',
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
                        'Do prvního odrazu (${toReflectionMs.toStringAsFixed(1)} ms)'),
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
            Text('Čas', style: t.textTheme.titleMedium),
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
                  segments: const [
                    ButtonSegment(value: true, label: Text('ETC (dB)')),
                    ButtonSegment(value: false, label: Text('impuls')),
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
              'Modré je okno, oranžová čára první nalezený odraz. Čas nula je '
              'přímý zvuk.',
              style: t.textTheme.bodySmall,
            ),
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
            Text('Doznívání po oktávách', style: t.textTheme.titleMedium),
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
              '${mid == null ? 'Střední pásma nedoklesla dost na T20.' : 'Střed 125–500 Hz: T20 ${mid.toStringAsFixed(2)} s — to je RT60, se kterým počítá návrh.'} '
              'V basech je RT60 z telefonu spíš odhad: šum pozadí tam bývá '
              'nejblíž a „—" znamená, že dozvuk pod něj nedoklesl. C50 nad '
              'nulou: přímý zvuk s prvními odrazy nese víc energie než dozvuk.',
              style: t.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.ir, required this.gate});

  final ImpulseResponse ir;
  final Duration gate;

  @override
  Widget build(BuildContext context) {
    final rt20 = ir.rt60(decayDb: 20);
    final rt30 = ir.rt60(decayDb: 30);
    final reflection = ir.firstReflectionIndex();
    final gated = ir.gated(window: gate);

    String ms(int samples) =>
        '${(samples / ir.sampleRate * 1000).toStringAsFixed(1)} ms';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Výsledek', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _Row('Přímý zvuk dorazil za', ms(ir.directSoundIndex),
                'Zpoždění přehrávání plus doba letu — samo o sobě nic neříká, '
                'ale rozdíl mezi L a R bednou ano.'),
            _Row(
              'První odraz',
              reflection == null
                  ? 'nenalezen'
                  : '${ms(reflection - ir.directSoundIndex)} po přímém zvuku',
              reflection == null
                  ? 'Buď tam žádný není, nebo se schoval ve vyzvánění '
                      'přímého impulsu.'
                  : 'Dráha navíc ≈ '
                      '${((reflection - ir.directSoundIndex) / ir.sampleRate * 343).toStringAsFixed(2)} m.',
            ),
            _Row(
              'RT60',
              rt20 == null
                  ? 'nezměřitelné'
                  : '${(rt20.inMilliseconds / 1000).toStringAsFixed(2)} s (T20)'
                      '${rt30 == null ? "" : " · ${(rt30.inMilliseconds / 1000).toStringAsFixed(2)} s (T30)"}',
              rt20 == null
                  ? 'Dozvuk nedoklesl dost hluboko nad šumové pozadí — '
                      'hlasitěji, nebo v tišší chvíli.'
                  : 'Rozdíl mezi T20 a T30 napovídá, jak čistý je doznívání.',
            ),
            _Row(
              'Okno (gating)',
              'platné nad '
                  '${gated.gatedResponseValidAbove.toStringAsFixed(0)} Hz',
              'Pod tím okno neuvidí ani jednu periodu — křivka tam je '
                  'artefakt okna, ne místnosti.',
            ),
            const SizedBox(height: 12),
            SizedBox(height: 120, child: _DecayChart(ir: ir)),
            Text('Schroederova křivka doznívání',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
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
