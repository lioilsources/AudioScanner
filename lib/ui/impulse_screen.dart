import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../app_state.dart';
import '../dsp/impulse_response.dart';
import '../export/frd.dart';
import '../signal/log_sweep.dart';
import '../store/session_store.dart';

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

  LogSweep get _sweep => LogSweep(
        startHz: _startHz,
        endHz: _endHz,
        duration: Duration(milliseconds: (_seconds * 1000).round()),
        sampleRate: widget.state.captureStatus?.sampleRate ?? 48000,
      );

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
              if (ir != null)
                IconButton(
                  icon: const Icon(Icons.ios_share),
                  tooltip: 'Export FRD s fází',
                  onPressed: () => _exportFrd(ir),
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
              if (ir != null) _Results(ir: ir),
            ],
          ),
        );
      },
    );
  }

  Future<void> _exportFrd(ImpulseResponse ir) async {
    final store = widget.store;
    if (store == null) return;
    final gated = ir.gated();
    final (freqs, levels) = gated.frequencyResponse();

    final text = FrdExport.fromImpulseResponse(
      frequencies: freqs,
      magnitudesDb: levels,
      // Phase from a magnitude-only path would be fabricated; this export is
      // magnitude with the gate's validity limit stated instead.
      phasesDeg: List<double>.filled(freqs.length, 0),
      session: widget.state.session,
      validAbove: gated.gatedResponseValidAbove,
    );
    final f = await store.writeExport('impulse_gated.frd', text);
    await SharePlus.instance
        .share(ShareParams(files: [XFile(f.path)], subject: 'Gated FRD'));
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.ir});

  final ImpulseResponse ir;

  @override
  Widget build(BuildContext context) {
    final rt20 = ir.rt60(decayDb: 20);
    final rt30 = ir.rt60(decayDb: 30);
    final reflection = ir.firstReflectionIndex();
    final gated = ir.gated();

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
