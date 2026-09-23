import 'package:flutter/material.dart';

import '../app_state.dart';
import '../ar/ar_tracking.dart';
import '../model/session.dart';

/// Phase 2: walk the room, drop measured points.
class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, required this.state});

  final AppState state;

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _tracking = false;
  bool _originSet = false;

  /// Continuous mode: take a point whenever the phone has moved this far from
  /// the last one. The plan's 0.5 m; anything denser mostly re-measures the
  /// same spot, since the microphone is not that repeatable.
  bool _continuous = false;
  static const _stepMetres = 0.5;
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.state,
      builder: (context, _) {
        final s = widget.state;
        final session = s.session;
        final pose = s.pose;

        if (_continuous && !_busy) _maybeAutoMeasure();

        return Scaffold(
          appBar: AppBar(
            title: Text(session?.name ?? 'Sken místnosti'),
            actions: [
              if (session != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Center(child: Text('${session.points.length} b.')),
                ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: session == null
                ? _NewSessionForm(onCreate: _createSession)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TrackingCard(
                        pose: pose,
                        tracking: _tracking,
                        originSet: _originSet,
                        onStart: _startTracking,
                        onSetOrigin: _setOrigin,
                      ),
                      const SizedBox(height: 12),
                      if (!s.listening)
                        Card(
                          color: Theme.of(context).colorScheme.errorContainer,
                          child: ListTile(
                            leading: const Icon(Icons.mic_off),
                            title: const Text('Mikrofon neběží'),
                            subtitle: const Text(
                                'Bez něj se změří jen poloha, ne zvuk.'),
                            onTap: s.startListening,
                          ),
                        ),
                      SwitchListTile(
                        value: _continuous,
                        onChanged: _originSet
                            ? (v) => setState(() => _continuous = v)
                            : null,
                        title: const Text('Průběžné měření'),
                        subtitle: const Text(
                            'Bod automaticky každých 0,5 m chůze'),
                        contentPadding: EdgeInsets.zero,
                      ),
                      const Divider(),
                      Expanded(child: _PointList(session: session)),
                    ],
                  ),
          ),
          floatingActionButton: session == null || !_originSet
              ? null
              : FloatingActionButton.extended(
                  onPressed: _busy || s.measuring ? null : _measureNow,
                  icon: s.measuring
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.add_location_alt_outlined),
                  label: Text(s.measuring ? 'Měřím…' : 'Změřit tady'),
                ),
        );
      },
    );
  }

  Future<void> _createSession(String name, ExcitationSignal signal) async {
    await widget.state.beginSession(name: name, signal: signal);
    if (!widget.state.listening) await widget.state.startListening();
  }

  Future<void> _startTracking() async {
    final ok = await widget.state.startTracking();
    if (mounted) setState(() => _tracking = ok);
  }

  Future<void> _setOrigin() async {
    await widget.state.tracking.setOrigin();
    if (mounted) setState(() => _originSet = true);
  }

  Future<void> _measureNow() async {
    setState(() => _busy = true);
    final point = await widget.state.measureHere();
    if (!mounted) return;
    setState(() => _busy = false);
    if (point != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bod ${point.id} uložen na ${point.position}')),
      );
    }
  }

  void _maybeAutoMeasure() {
    final d = widget.state.distanceFromLastPoint;
    final hasPoints = widget.state.session?.points.isNotEmpty ?? false;
    if (!hasPoints || (d != null && d >= _stepMetres)) {
      _busy = true;
      // Fires outside build; setState inside _measureNow handles the rest.
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureNow());
    }
  }
}

class _TrackingCard extends StatelessWidget {
  const _TrackingCard({
    required this.pose,
    required this.tracking,
    required this.originSet,
    required this.onStart,
    required this.onSetOrigin,
  });

  final ArPose? pose;
  final bool tracking;
  final bool originSet;
  final VoidCallback onStart;
  final VoidCallback onSetOrigin;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (!tracking) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.view_in_ar_outlined),
          title: const Text('Spustit sledování polohy'),
          subtitle: const Text(
              'ARKit — odsud ví appka, kde v místnosti stojíš.'),
          onTap: onStart,
        ),
      );
    }

    final q = pose?.quality ?? TrackingQuality.unavailable;
    final good = q.usableForMeasurement;
    return Card(
      color: good ? null : scheme.tertiaryContainer,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              good ? Icons.gps_fixed : Icons.gps_not_fixed,
              color: good ? scheme.primary : scheme.onTertiaryContainer,
            ),
            title: Text(q.label),
            subtitle: Text(
              pose?.hint ??
                  (originSet
                      ? 'Poloha: ${pose?.position ?? "—"} m od počátku'
                      : 'Postav se na místo posluchače a urči počátek.'),
            ),
          ),
          if (!originSet)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: FilledButton.icon(
                onPressed: good ? onSetOrigin : null,
                icon: const Icon(Icons.my_location),
                label: const Text('Tady je počátek'),
              ),
            ),
        ],
      ),
    );
  }
}

class _PointList extends StatelessWidget {
  const _PointList({required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    if (session.points.isEmpty) {
      return Center(
        child: Text('Zatím žádný bod.',
            style: Theme.of(context).textTheme.bodyMedium),
      );
    }
    return ListView.builder(
      itemCount: session.points.length,
      itemBuilder: (context, i) {
        // Newest first: during a walk the last point is the one being checked.
        final p = session.points[session.points.length - 1 - i];
        return ListTile(
          dense: true,
          leading: CircleAvatar(radius: 14, child: Text(p.id.substring(1))),
          title: Text('${p.position} m'),
          subtitle: Text('rozptyl 40–300 Hz: '
              '${p.variationDb().toStringAsFixed(1)} dB · '
              '${p.rmsDbfs.toStringAsFixed(1)} dBFS'),
        );
      },
    );
  }
}

class _NewSessionForm extends StatefulWidget {
  const _NewSessionForm({required this.onCreate});

  final Future<void> Function(String, ExcitationSignal) onCreate;

  @override
  State<_NewSessionForm> createState() => _NewSessionFormState();
}

class _NewSessionFormState extends State<_NewSessionForm> {
  final _name = TextEditingController(text: 'Obývák');
  ExcitationSignal _signal = ExcitationSignal.externalSweep;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Nové měření', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        TextField(
          controller: _name,
          decoration: const InputDecoration(
            labelText: 'Název místnosti',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Text('Čím budeš místnost budit',
            style: Theme.of(context).textTheme.titleSmall),
        RadioGroup<ExcitationSignal>(
          groupValue: _signal,
          onChanged: (v) => setState(() => _signal = v!),
          child: Column(
            children: [
              for (final s in ExcitationSignal.values)
                RadioListTile<ExcitationSignal>(
                  value: s,
                  title: Text(s.label),
                  subtitle: s == ExcitationSignal.phonePinkNoise
                      ? const Text('Jen orientačně — reproduktor telefonu '
                          'basy vůbec nevydá.')
                      : null,
                  contentPadding: EdgeInsets.zero,
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => widget.onCreate(_name.text.trim(), _signal),
          child: const Text('Začít'),
        ),
      ],
    );
  }
}
