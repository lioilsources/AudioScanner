import 'package:flutter/material.dart';

import '../analysis/response_analysis.dart';
import '../app_state.dart';
import '../dsp/impulse_response.dart';
import '../dsp/octave_bands.dart';
import '../model/measurement.dart';
import '../model/session.dart';
import '../room/speaker_layout.dart';
import '../store/session_store.dart';
import 'widgets/response_chart.dart';

/// Two points of the session side by side — L against R, before against
/// after EQ, this seat against that one.
///
/// Points with a stored impulse response are compared at full resolution
/// (gated and with the room); points from the noise walk only have their 31
/// bands, and are drawn as such. The difference curve is what the eye cannot
/// do reliably from two overlaid traces.
class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key, required this.state, this.store});

  final AppState state;
  final SessionStore? store;

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  List<Session> _sessions = const [];
  Session? _sessionA;
  Session? _sessionB;
  Measurement? _a;
  Measurement? _b;
  ImpulseResponse? _irA;
  ImpulseResponse? _irB;
  ResponseAnalysis? _anA;
  ResponseAnalysis? _anB;
  bool _gatedView = false;
  int _smoothing = 6;
  static const _gate = Duration(milliseconds: 5);

  @override
  void initState() {
    super.initState();
    final current = widget.state.session;
    _sessionA = current;
    _sessionB = current;
    final points = current?.points ?? const <Measurement>[];
    // Default to the most useful pair when it exists: the front L/R.
    final l = current?.latestFor(Channel.frontLeft.name);
    final r = current?.latestFor(Channel.frontRight.name);
    _a = l ?? (points.isNotEmpty ? points.first : null);
    _b = r ?? (points.length > 1 ? points[1] : null);
    _load();
    widget.store?.listAll().then((all) {
      if (!mounted) return;
      setState(() {
        _sessions = [
          ?(current != null && !all.any((s) => s.id == current.id) ? current : null),
          ...all,
        ];
      });
    });
  }

  /// Sessions offered in the pickers: everything on disk plus the live one.
  List<Session> get _choices {
    final current = widget.state.session;
    if (_sessions.isNotEmpty) return _sessions;
    return [if (current != null) current];
  }

  Future<void> _load() async {
    final a = _a, b = _b;
    final irA = a == null ? null : await widget.state.impulseFor(a);
    final irB = b == null ? null : await widget.state.impulseFor(b);
    if (!mounted) return;
    setState(() {
      _irA = (irA?.samples.isEmpty ?? true) ? null : irA;
      _irB = (irB?.samples.isEmpty ?? true) ? null : irB;
      _anA = _irA == null ? null : ResponseAnalysis.of(_irA!, gate: _gate);
      _anB = _irB == null ? null : ResponseAnalysis.of(_irB!, gate: _gate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final total = _choices.fold(0, (n, s) => n + s.points.length);
    final pointsA = _sessionA?.points ?? const <Measurement>[];
    final pointsB = _sessionB?.points ?? const <Measurement>[];
    return Scaffold(
      appBar: AppBar(title: const Text('Srovnání')),
      body: total < 2
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text('Srovnání potřebuje aspoň dva body.',
                    textAlign: TextAlign.center),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (_choices.length > 1)
                  _sessionPicker('A', _sessionA, (s) {
                    setState(() {
                      _sessionA = s;
                      _a = s?.points.firstOrNull;
                    });
                    _load();
                  }),
                _picker('A', _a, pointsA, (m) {
                  setState(() => _a = m);
                  _load();
                }),
                if (_choices.length > 1)
                  _sessionPicker('B', _sessionB, (s) {
                    setState(() {
                      _sessionB = s;
                      _b = s?.points.firstOrNull;
                    });
                    _load();
                  }),
                _picker('B', _b, pointsB, (m) {
                  setState(() => _b = m);
                  _load();
                }),
                const SizedBox(height: 12),
                if (_a != null && _b != null) ...[
                  SizedBox(height: 240, child: _chart(t)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (_anA != null && _anB != null)
                        SegmentedButton<bool>(
                          segments: const [
                            ButtonSegment(value: false, label: Text('s místností')),
                            ButtonSegment(value: true, label: Text('přímý zvuk')),
                          ],
                          selected: {_gatedView},
                          showSelectedIcon: false,
                          onSelectionChanged: (v) =>
                              setState(() => _gatedView = v.first),
                        ),
                      if (_anA != null && _anB != null)
                        SegmentedButton<int>(
                          segments: const [
                            ButtonSegment(value: 3, label: Text('1/3')),
                            ButtonSegment(value: 6, label: Text('1/6')),
                            ButtonSegment(value: 12, label: Text('1/12')),
                          ],
                          selected: {_smoothing},
                          showSelectedIcon: false,
                          onSelectionChanged: (v) =>
                              setState(() => _smoothing = v.first),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _numbers(t),
                ],
              ],
            ),
    );
  }

  Widget _sessionPicker(
      String label, Session? value, ValueChanged<Session?> onChanged) {
    return Row(
      children: [
        SizedBox(width: 24, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
          child: DropdownButton<Session>(
            value: value != null && _choices.any((s) => s.id == value.id)
                ? _choices.firstWhere((s) => s.id == value.id)
                : null,
            isExpanded: true,
            hint: const Text('Session'),
            items: [
              for (final s in _choices)
                DropdownMenuItem(
                    value: s, child: Text('${s.name} · ${s.points.length} b.')),
            ],
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _picker(String label, Measurement? value, List<Measurement> points,
      ValueChanged<Measurement?> onChanged) {
    return Row(
      children: [
        SizedBox(width: 24, child: Text(label)),
        Expanded(
          child: DropdownButton<Measurement>(
            value: value != null && points.contains(value) ? value : null,
            isExpanded: true,
            items: [
              for (final p in points)
                DropdownMenuItem(value: p, child: Text(_name(p))),
            ],
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  static String _name(Measurement p) {
    final ch = p.channel == null
        ? null
        : Channel.values.where((c) => c.name == p.channel).firstOrNull;
    final base = ch?.label ?? '${p.id} ${p.position}';
    return '$base${p.afterEq ? ' · po EQ' : ''}'
        '${p.impulse != null ? ' · sweep' : ''}';
  }

  Widget _chart(ThemeData t) {
    final anA = _anA, anB = _anB;
    final colorA = t.colorScheme.primary;
    final colorB = t.colorScheme.tertiary;
    final colorDiff = t.colorScheme.onSurfaceVariant.withValues(alpha: 0.7);

    final ctx = widget.state.correctionContext;
    if (anA != null && anB != null) {
      final a = ctx.correctedCurve(anA.frequencies,
          _gatedView ? anA.gatedSmoothed(_smoothing) : anA.roomSmoothed(_smoothing));
      final b = ctx.correctedCurve(anB.frequencies,
          _gatedView ? anB.gatedSmoothed(_smoothing) : anB.roomSmoothed(_smoothing));
      // The two analyses share an FFT length only when the recordings are
      // the same length; the difference is drawn on A's axis and B is
      // looked up by frequency.
      final diff = List<double>.generate(anA.frequencies.length, (i) {
        final f = anA.frequencies[i];
        final j = (f / (anB.frequencies.length > 1 ? anB.frequencies[1] : 1)).round();
        if (j < 0 || j >= b.length) return double.nan;
        return a[i] - b[j];
      });
      return ResponseChart(
        curves: [
          ResponseCurve(frequencies: anA.frequencies, levelsDb: a, label: 'A', color: colorA),
          ResponseCurve(frequencies: anB.frequencies, levelsDb: b, label: 'B', color: colorB),
          ResponseCurve(
              frequencies: anA.frequencies,
              levelsDb: diff,
              label: 'A − B',
              color: colorDiff,
              strokeWidth: 1.5),
        ],
        validAbove: _gatedView ? anA.validAbove : anA.room.gatedResponseValidAbove,
      );
    }

    // Band data only: 31 points each, drawn as the steps they are.
    final freqs = [for (final b in OctaveBands.all) b.nominal];
    final a = ctx.correctedBands(_a!.bandsDb);
    final b = ctx.correctedBands(_b!.bandsDb);
    return ResponseChart(
      curves: [
        ResponseCurve(frequencies: freqs, levelsDb: a, label: 'A (pásma)', color: colorA),
        ResponseCurve(frequencies: freqs, levelsDb: b, label: 'B (pásma)', color: colorB),
        ResponseCurve(
            frequencies: freqs,
            levelsDb: [for (var i = 0; i < a.length; i++) a[i] - b[i]],
            label: 'A − B',
            color: colorDiff,
            strokeWidth: 1.5),
      ],
    );
  }

  Widget _numbers(ThemeData t) {
    final a = _a!, b = _b!;
    final rows = <(String, String)>[];

    final ia = a.impulse, ib = b.impulse;
    if (ia != null && ib != null) {
      final dt = ia.arrivalMs - ib.arrivalMs;
      rows.add(('Rozdíl příchodu A − B',
          '${dt.toStringAsFixed(2)} ms ≈ ${(dt * 0.343).toStringAsFixed(1)} cm'));
      if (ia.rt20 != null && ib.rt20 != null) {
        rows.add(('T20',
            '${(ia.rt20!.inMilliseconds / 1000).toStringAsFixed(2)} s / '
                '${(ib.rt20!.inMilliseconds / 1000).toStringAsFixed(2)} s'));
      }
    }
    rows.add(('Širokopásmová hladina A − B',
        '${(a.rmsDbfs - b.rmsDbfs).toStringAsFixed(1)} dB'));

    var worst = 0.0;
    OctaveBand? worstBand;
    for (var i = 0; i < OctaveBands.all.length; i++) {
      final band = OctaveBands.all[i];
      if (band.nominal > 300) continue;
      final d = (a.bandsDb[i] - b.bandsDb[i]).abs();
      if (d > worst) {
        worst = d;
        worstBand = band;
      }
    }
    if (worstBand != null) {
      rows.add(('Největší rozdíl pod 300 Hz',
          '${worst.toStringAsFixed(1)} dB v pásmu ${worstBand.label} Hz'));
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            for (final (label, value) in rows)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(label, style: t.textTheme.bodyMedium),
                    Text(value,
                        style: t.textTheme.titleSmall
                            ?.copyWith(color: t.colorScheme.primary)),
                  ],
                ),
              ),
            const SizedBox(height: 4),
            Text(
              'Distance a level trim srovnají rozdíl příchodu a hladiny. '
              'Rozdíl tvaru pod 300 Hz nesrovnají — ten dělá jiná stěna v jiné '
              'vzdálenosti a řeší se posunem.',
              style: t.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
