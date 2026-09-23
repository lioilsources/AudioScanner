import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../signal/log_sweep.dart';
import '../signal/pink_noise.dart';
import '../signal/wav.dart';
import '../store/session_store.dart';

/// Phase 1 + 3: build the test signals and get them onto the system that
/// actually drives the speakers.
///
/// Exporting a WAV rather than playing from the phone is the point. A sweep
/// from the phone's own speaker measures the phone: its driver gives up around
/// 500 Hz, which is above every room mode worth finding.
class SignalsScreen extends StatefulWidget {
  const SignalsScreen({super.key, this.store});

  final SessionStore? store;

  @override
  State<SignalsScreen> createState() => _SignalsScreenState();
}

class _SignalsScreenState extends State<SignalsScreen> {
  double _seconds = 10;
  double _startHz = 20;
  double _endHz = 20000;
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Signály')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Log sweep', style: t.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    'Jediný signál, ze kterého jde spočítat impulzní odezvu, '
                    'doba dozvuku a první odrazy. Přehraj ho z počítače nebo '
                    'DACu do beden, telefon nech nahrávat.',
                    style: t.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  _Slider(
                    label: 'Délka',
                    value: _seconds,
                    min: 3,
                    max: 30,
                    suffix: 's',
                    onChanged: (v) => setState(() => _seconds = v),
                  ),
                  _Slider(
                    label: 'Od',
                    value: _startHz,
                    min: 10,
                    max: 200,
                    suffix: 'Hz',
                    onChanged: (v) => setState(() => _startHz = v),
                  ),
                  _Slider(
                    label: 'Do',
                    value: _endHz,
                    min: 5000,
                    max: 22000,
                    suffix: 'Hz',
                    onChanged: (v) => setState(() => _endHz = v),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilledButton.tonal(
                        onPressed: _busy ? null : () => _exportSweep(null),
                        child: const Text('Mono'),
                      ),
                      FilledButton.tonal(
                        onPressed: _busy ? null : () => _exportSweep(true),
                        child: const Text('Jen levá'),
                      ),
                      FilledButton.tonal(
                        onPressed: _busy ? null : () => _exportSweep(false),
                        child: const Text('Jen pravá'),
                      ),
                    ],
                  ),
                  Text(
                    'Levá a pravá zvlášť — jinak se obě bedny sečtou a jejich '
                    'rozdíl zmizí v součtu.',
                    style: t.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Růžový šum', style: t.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    'Stejná energie v každé oktávě. Dá jen frekvenční '
                    'charakteristiku, žádný čas ani odrazy — na rychlé '
                    '„dělá to tu něco?" to stačí.',
                    style: t.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  FilledButton.tonal(
                    onPressed: _busy ? null : _exportPink,
                    child: const Text('Export 30 s WAV'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: t.colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jak měřit', style: t.textTheme.titleSmall),
                  const SizedBox(height: 8),
                  const _Step('Signál pusť z počítače do beden, ne z telefonu.'),
                  const _Step('Hlasitost nastav tak, aby analyzátor ukazoval '
                      'kolem −20 dBFS. Přebuzení vypadá jako odraz.'),
                  const _Step('Telefon drž svisle na natažené ruce, '
                      'mikrofonem k bednám.'),
                  const _Step('Odpoj Bluetooth sluchátka — komprese i latence '
                      'měření znehodnotí.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _exportSweep(bool? left) async {
    final sweep = LogSweep(
      startHz: _startHz,
      endHz: _endHz,
      duration: Duration(milliseconds: (_seconds * 1000).round()),
    );
    final mono = sweep.generate();
    final name = left == null
        ? 'sweep_${_startHz.round()}-${_endHz.round()}_${_seconds.round()}s.wav'
        : 'sweep_${left ? "L" : "R"}_${_seconds.round()}s.wav';
    final bytes = left == null
        ? Wav.pcm16(samples: mono, sampleRate: sweep.sampleRate.round())
        : Wav.pcm16(
            samples: Wav.toStereo(mono, left: left),
            sampleRate: sweep.sampleRate.round(),
            channels: 2,
          );
    await _shareBytes(name, bytes);
  }

  Future<void> _exportPink() async {
    final noise = PinkNoise().generate(48000 * 30);
    await _shareBytes(
        'pink_noise_30s.wav', Wav.pcm16(samples: noise, sampleRate: 48000));
  }

  Future<void> _shareBytes(String name, List<int> bytes) async {
    final store = widget.store;
    if (store == null) return;
    setState(() => _busy = true);
    try {
      final file = await store.writeExportBytes(name, bytes);
      await SharePlus.instance.share(
        ShareParams(files: [XFile(file.path)], subject: name),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}

class _Slider extends StatelessWidget {
  const _Slider({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.suffix,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final String suffix;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SizedBox(width: 40, child: Text(label)),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: 70,
            child: Text('${value.round()} $suffix', textAlign: TextAlign.end),
          ),
        ],
      );
}

class _Step extends StatelessWidget {
  const _Step(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('· '),
            Expanded(
                child: Text(text,
                    style: Theme.of(context).textTheme.bodySmall)),
          ],
        ),
      );
}
