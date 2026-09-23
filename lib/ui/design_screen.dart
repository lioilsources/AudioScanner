import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../app_state.dart';
import '../room/design_report.dart';
import '../room/room_capture.dart';
import '../room/room_geometry.dart';
import '../room/speaker_layout.dart';
import '../store/session_store.dart';

/// Phase 5: put the geometry and the measurements together and say what to do.
class DesignScreen extends StatefulWidget {
  const DesignScreen({super.key, required this.state, this.store});

  final AppState state;
  final SessionStore? store;

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  final _capture = RoomCapture();
  ScannedRoom? _scanned;
  bool? _lidarSupported;
  bool _scanning = false;

  double _length = 6.0;
  double _width = 4.2;
  double _height = 2.5;

  DesignReport? _report;

  @override
  void initState() {
    super.initState();
    _capture.isSupported().then((v) {
      if (mounted) setState(() => _lidarSupported = v);
    }).catchError((_) {
      if (mounted) setState(() => _lidarSupported = false);
    });
  }

  RoomGeometry get _room =>
      _scanned?.geometry ??
      RoomGeometry(
        length: _length,
        width: _width,
        height: _height,
        // A measured impulse response beats the Sabine guess whenever there is
        // one — damping drives every modal prediction below.
        rt60: widget.state.impulseResponse
                ?.rt60()
                ?.inMilliseconds
                .toDouble()
                .let((ms) => ms / 1000) ??
            0.4,
      );

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Návrh'),
        actions: [
          if (_report != null)
            IconButton(
              icon: const Icon(Icons.ios_share),
              tooltip: 'Export konfigurace',
              onPressed: _export,
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _lidarCard(),
          const SizedBox(height: 12),
          if (_scanned == null) _manualDimensions(),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: _build,
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Spočítat návrh'),
          ),
          const SizedBox(height: 16),
          if (_report != null) ..._results(_report!, t),
        ],
      ),
    );
  }

  Widget _lidarCard() {
    final supported = _lidarSupported;
    final scanned = _scanned;
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(supported == true
                ? Icons.view_in_ar
                : Icons.straighten),
            title: Text(switch (supported) {
              null => 'Zjišťuju, jestli je tu LiDAR…',
              true => 'LiDAR k dispozici',
              false => 'Bez LiDARu — rozměry zadej ručně',
            }),
            subtitle: Text(scanned?.caveat ??
                (supported == true
                    ? 'Sken dá stěny na centimetry, takže sedí i body odrazů '
                        'a vzdálenosti k hranicím, ne jen módy.'
                    : 'Modální výpočet potřebuje jen tři čísla — o body '
                        'odrazů a přesné vzdálenosti ke stěnám ale přijdeš.')),
          ),
          if (supported == true)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: FilledButton.tonalIcon(
                onPressed: _scanning ? _stopScan : _startScan,
                icon: Icon(_scanning ? Icons.stop : Icons.document_scanner),
                label: Text(_scanning ? 'Ukončit sken' : 'Naskenovat místnost'),
              ),
            ),
          if (scanned != null)
            ListTile(
              dense: true,
              title: Text('${scanned.geometry.length.toStringAsFixed(2)} × '
                  '${scanned.geometry.width.toStringAsFixed(2)} × '
                  '${scanned.geometry.height.toStringAsFixed(2)} m'),
              subtitle: Text('${scanned.wallCount} stěn, '
                  '${scanned.openings.length} otvorů'),
            ),
        ],
      ),
    );
  }

  Widget _manualDimensions() => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rozměry místnosti',
                  style: Theme.of(context).textTheme.titleMedium),
              _dim('Délka', _length, 2, 12, (v) => setState(() => _length = v)),
              _dim('Šířka', _width, 2, 10, (v) => setState(() => _width = v)),
              _dim('Výška', _height, 2, 4, (v) => setState(() => _height = v)),
            ],
          ),
        ),
      );

  Widget _dim(String label, double value, double min, double max,
          ValueChanged<double> onChanged) =>
      Row(
        children: [
          SizedBox(width: 56, child: Text(label)),
          Expanded(
            child: Slider(
                value: value, min: min, max: max, onChanged: onChanged),
          ),
          SizedBox(
            width: 64,
            child: Text('${value.toStringAsFixed(2)} m',
                textAlign: TextAlign.end),
          ),
        ],
      );

  List<Widget> _results(DesignReport r, ThemeData t) {
    return [
      Text('Co s tím udělat', style: t.textTheme.titleLarge),
      const SizedBox(height: 8),
      for (final f in r.findings)
        Card(
          color: switch (f.severity) {
            Severity.critical => t.colorScheme.errorContainer,
            Severity.important => t.colorScheme.tertiaryContainer,
            Severity.worthDoing => null,
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(f.title, style: t.textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(f.detail, style: t.textTheme.bodySmall),
                if (f.action != null) ...[
                  const SizedBox(height: 6),
                  Text(f.action!,
                      style: t.textTheme.bodySmall
                          ?.copyWith(fontStyle: FontStyle.italic)),
                ],
              ],
            ),
          ),
        ),
      const SizedBox(height: 16),
      Text('Módy místnosti', style: t.textTheme.titleLarge),
      Text('Nad ${r.room.schroederFrequency.toStringAsFixed(0)} Hz '
          '(Schroeder) už jednotlivé módy nedávají smysl.',
          style: t.textTheme.bodySmall),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final m in r.axialModes)
            Chip(
              label: Text('${m.frequency.toStringAsFixed(0)} Hz · ${m.axis}'),
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
      const SizedBox(height: 16),
      Text('Subwoofer', style: t.textTheme.titleLarge),
      for (final c in r.subwooferCandidates.take(3))
        ListTile(
          dense: true,
          leading: const Icon(Icons.speaker, size: 18),
          title: Text('${c.position}'),
          trailing: Text('${c.flatnessDb.toStringAsFixed(1)} dB'),
        ),
      const SizedBox(height: 16),
      Text('Konfigurace přijímače', style: t.textTheme.titleLarge),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SelectableText(
            r.config.render(),
            style: const TextStyle(fontFamily: 'Menlo', fontSize: 11),
          ),
        ),
      ),
    ];
  }

  Future<void> _startScan() async {
    await _capture.start();
    if (!mounted) return;
    setState(() => _scanning = true);
    _capture.rooms.listen((room) {
      if (mounted) setState(() => _scanned = room);
    });
  }

  Future<void> _stopScan() async {
    await _capture.stop();
    if (mounted) setState(() => _scanning = false);
  }

  void _build() {
    final room = _room;
    final session = widget.state.session;
    // With no hand-placed speakers yet, lay out a textbook 7.1.4 in this room
    // and report against that — it answers "where should they go" before any
    // are moved, which is the more useful question first time round.
    final seat = RoomPoint(room.length * 0.62, room.width / 2, 1.15);
    setState(() {
      _report = buildDesignReport(
        room: room,
        seat: seat,
        speakers: _referenceLayout(room, seat),
        measurements: session?.points ?? const [],
        forward: math.pi,
      );
    });
  }

  /// A Dolby-correct 7.1.4 for this room, used as the starting point.
  List<SpeakerPlacement> _referenceLayout(RoomGeometry room, RoomPoint seat) {
    final target = dolbyTargets;
    RoomPoint at(Channel ch, double radius, {double? elevationDeg}) {
      final tgt = target[ch]!;
      final az = tgt.azimuthIdeal * math.pi / 180;
      final el = (elevationDeg ?? tgt.elevationIdeal) * math.pi / 180;
      final left = ch.name.toLowerCase().contains('left');
      final horizontal = radius * math.cos(el);
      // forward = π, so "ahead" is −x.
      return RoomPoint(
        seat.x - horizontal * math.cos(az),
        seat.y + (left ? -1 : 1) * horizontal * math.sin(az),
        (seat.z + radius * math.sin(el)).clamp(0.3, room.height - 0.1),
      );
    }

    final r = math.min(room.length, room.width) * 0.45;
    return [
      SpeakerPlacement(channel: Channel.frontLeft, position: at(Channel.frontLeft, r)),
      SpeakerPlacement(
          channel: Channel.center, position: RoomPoint(seat.x - r, seat.y, 0.8)),
      SpeakerPlacement(channel: Channel.frontRight, position: at(Channel.frontRight, r)),
      SpeakerPlacement(channel: Channel.surroundLeft, position: at(Channel.surroundLeft, r)),
      SpeakerPlacement(channel: Channel.surroundRight, position: at(Channel.surroundRight, r)),
      SpeakerPlacement(
          channel: Channel.surroundBackLeft, position: at(Channel.surroundBackLeft, r)),
      SpeakerPlacement(
          channel: Channel.surroundBackRight, position: at(Channel.surroundBackRight, r)),
      SpeakerPlacement(
          channel: Channel.heightFrontLeft, position: at(Channel.heightFrontLeft, r)),
      SpeakerPlacement(
          channel: Channel.heightFrontRight, position: at(Channel.heightFrontRight, r)),
      SpeakerPlacement(
          channel: Channel.heightRearLeft, position: at(Channel.heightRearLeft, r)),
      SpeakerPlacement(
          channel: Channel.heightRearRight, position: at(Channel.heightRearRight, r)),
      SpeakerPlacement(
          channel: Channel.subwoofer,
          position: RoomPoint(room.length * 0.15, room.width * 0.15, 0.3)),
    ];
  }

  Future<void> _export() async {
    final store = widget.store;
    final report = _report;
    if (store == null || report == null) return;
    final f = await store.writeExport('avr_config.txt', report.config.render());
    await SharePlus.instance.share(
        ShareParams(files: [XFile(f.path)], subject: 'Návrh konfigurace'));
  }
}

extension<T> on T {
  R let<R>(R Function(T) f) => f(this);
}
