import 'package:flutter/material.dart';

import '../app_state.dart';
import '../model/measurement.dart';
import '../room/speaker_layout.dart';
import '../signal/log_sweep.dart';

/// Measure each receiver channel with a sweep, from the seat.
///
/// One channel at a time, one file per channel from the Signals tab. The
/// point stored carries the channel name, which is what the design report
/// keys its EQ and level trims on; without it the report has nothing to work
/// from and says so.
class ChannelMeasureCard extends StatefulWidget {
  const ChannelMeasureCard({
    super.key,
    required this.state,
    required this.channels,
  });

  final AppState state;
  final List<Channel> channels;

  @override
  State<ChannelMeasureCard> createState() => _ChannelMeasureCardState();
}

class _ChannelMeasureCardState extends State<ChannelMeasureCard> {
  Channel? _recording;
  bool _afterEq = false;
  double _seconds = 10;

  LogSweep get _sweep => LogSweep(
        duration: Duration(milliseconds: (_seconds * 1000).round()),
        sampleRate: widget.state.captureStatus?.sampleRate ?? 48000,
      );

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final s = widget.state;
    final session = s.session;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Měření kanálů', style: t.textTheme.titleMedium),
            Text(
              'Stoupni si na místo posluchače. Pro každý kanál: začni '
              'nahrávat, pusť do něj sweep ze záložky Signály, klepni na '
              'Hotovo. Bez těchto bodů návrh nemá z čeho udělat EQ a '
              'hlasitosti.',
              style: t.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Sweep ${_seconds.round()} s', style: t.textTheme.bodyMedium),
                Expanded(
                  child: Slider(
                    value: _seconds,
                    min: 3,
                    max: 30,
                    divisions: 27,
                    onChanged:
                        _recording != null ? null : (v) => setState(() => _seconds = v),
                  ),
                ),
              ],
            ),
            SwitchListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text('Ověření po zadání EQ'),
              subtitle: const Text('Bod se uloží jako „po EQ" a nepřepíše '
                  'ten, ze kterého se EQ počítalo.'),
              value: _afterEq,
              onChanged: _recording != null
                  ? null
                  : (v) => setState(() => _afterEq = v),
            ),
            if (!s.listening)
              TextButton.icon(
                onPressed: s.startListening,
                icon: const Icon(Icons.mic),
                label: const Text('Spustit mikrofon'),
              ),
            for (final ch in widget.channels)
              _channelRow(ch, session?.latestFor(ch.name, afterEq: _afterEq), t),
          ],
        ),
      ),
    );
  }

  Widget _channelRow(Channel ch, Measurement? latest, ThemeData t) {
    final s = widget.state;
    final recordingThis = _recording == ch;
    final summary = latest?.impulse;
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        latest == null ? Icons.radio_button_unchecked : Icons.check_circle,
        color: latest == null ? t.colorScheme.outline : t.colorScheme.primary,
      ),
      title: Text(ch.label),
      subtitle: Text(recordingThis
          ? 'Nahrávám ${s.recordedSeconds.toStringAsFixed(1)} s — teď pusť sweep'
          : summary == null
              ? (latest == null ? 'nezměřeno' : 'změřeno šumem')
              : 'přímý zvuk za ${summary.arrivalMs.toStringAsFixed(1)} ms'
                  '${summary.rt20 == null ? '' : ', T20 ${(summary.rt20!.inMilliseconds / 1000).toStringAsFixed(2)} s'}'),
      trailing: recordingThis
          ? FilledButton(
              onPressed: () => _finish(ch),
              child: const Text('Hotovo'),
            )
          : OutlinedButton(
              onPressed: _recording == null && s.listening ? () => _start(ch) : null,
              child: Text(latest == null ? 'Změřit' : 'Znovu'),
            ),
    );
  }

  void _start(Channel ch) {
    widget.state.startSweepRecording();
    setState(() => _recording = ch);
  }

  Future<void> _finish(Channel ch) async {
    final s = widget.state;
    final ir = s.finishSweepRecording(_sweep);
    setState(() => _recording = null);
    if (ir == null) return;
    await s.addSweepMeasurement(channel: ch.name, afterEq: _afterEq);
  }
}
