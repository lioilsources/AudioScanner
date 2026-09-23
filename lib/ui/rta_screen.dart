import 'package:flutter/material.dart';

import '../app_state.dart';
import '../dsp/octave_bands.dart';
import 'widgets/spectrum_bars.dart';

/// Phase 1: the live analyser.
///
/// The screen that has to work before anything else is worth building — if the
/// bars do not visibly change as you walk across the room, nothing downstream
/// means anything.
class RtaScreen extends StatefulWidget {
  const RtaScreen({super.key, required this.state});

  final AppState state;

  @override
  State<RtaScreen> createState() => _RtaScreenState();
}

class _RtaScreenState extends State<RtaScreen> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.state,
      builder: (context, _) {
        final s = widget.state;
        final spectrum = s.spectrum;
        final status = s.captureStatus;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Analyzátor'),
            actions: [
              IconButton(
                icon: Icon(s.listening ? Icons.stop : Icons.play_arrow),
                tooltip: s.listening ? 'Zastavit' : 'Spustit mikrofon',
                onPressed: () =>
                    s.listening ? s.stopListening() : s.startListening(),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (s.error != null) _Banner(text: s.error!, onClose: s.clearError),
                if (status?.warning != null)
                  _Banner(text: status!.warning!, severity: _Severity.warning),
                if (status != null && status.isTrustworthy)
                  _Chip(
                    icon: Icons.check_circle_outline,
                    text: '${status.route} · '
                        '${status.sampleRate.toStringAsFixed(0)} Hz · bez úprav signálu',
                  ),
                const SizedBox(height: 12),
                _LevelRow(
                  rmsDbfs: spectrum?.rmsDbfs,
                  listening: s.listening,
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: spectrum == null
                      ? const _Placeholder()
                      : SpectrumBars(
                          bandsDb: spectrum.bandsDb,
                          reference: s.referenceBands,
                        ),
                ),
                const SizedBox(height: 8),
                Text(
                  s.referenceBands == null
                      ? 'Hladiny jsou relativní (dBFS). Obrys se objeví, až '
                          'uložíš první bod — ten je referencí pro ostatní.'
                      : 'Plné sloupce = tady. Obrys = referenční bod.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LevelRow extends StatelessWidget {
  const _LevelRow({required this.rmsDbfs, required this.listening});

  final double? rmsDbfs;
  final bool listening;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final v = rmsDbfs;
    // Anything under about −60 dBFS is the phone's own noise floor, not the
    // room; saying so beats showing a confident number made of nothing.
    final tooQuiet = v != null && v < -60;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          v == null ? '—' : v.toStringAsFixed(1),
          style: t.textTheme.displaySmall?.copyWith(
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
        const SizedBox(width: 6),
        Text('dBFS', style: t.textTheme.titleMedium),
        const Spacer(),
        if (!listening)
          Text('mikrofon stojí', style: t.textTheme.bodySmall)
        else if (tooQuiet)
          Text('ticho — hraje signál?',
              style: t.textTheme.bodySmall
                  ?.copyWith(color: t.colorScheme.error)),
      ],
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.graphic_eq,
                size: 48, color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 12),
            Text('Spusť mikrofon a pusť do místnosti signál.',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('${OctaveBands.all.length} třetinooktávových pásem, '
                '20 Hz – 20 kHz',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      );
}

enum _Severity { error, warning }

class _Banner extends StatelessWidget {
  const _Banner({required this.text, this.onClose, this.severity = _Severity.error});

  final String text;
  final VoidCallback? onClose;
  final _Severity severity;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = severity == _Severity.error
        ? scheme.errorContainer
        : scheme.tertiaryContainer;
    final fg = severity == _Severity.error
        ? scheme.onErrorContainer
        : scheme.onTertiaryContainer;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(
            severity == _Severity.error
                ? Icons.error_outline
                : Icons.warning_amber_outlined,
            size: 18,
            color: fg,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: fg)),
          ),
          if (onClose != null)
            IconButton(
              icon: const Icon(Icons.close, size: 16),
              color: fg,
              onPressed: onClose,
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 15, color: scheme.primary),
        const SizedBox(width: 6),
        Expanded(
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: scheme.onSurfaceVariant)),
        ),
      ],
    );
  }
}
