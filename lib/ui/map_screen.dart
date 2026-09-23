import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../analysis/heatmap.dart';
import '../app_state.dart';
import '../dsp/octave_bands.dart';
import '../export/frd.dart';
import '../model/measurement.dart';
import '../store/session_store.dart';
import 'widgets/heatmap_view.dart';

/// Phase 2 + 4: the floor-plan heatmap, one band at a time, plus exports.
class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.state, this.store});

  final AppState state;
  final SessionStore? store;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  /// Start at 63 Hz — the plan's own example, and where a room is most likely
  /// to be visibly doing something.
  int _bandIndex = OctaveBands.all.indexWhere((b) => b.nominal == 63);
  bool _exporting = false;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.state,
      builder: (context, _) {
        final session = widget.state.session;
        final points = session?.points ?? const <Measurement>[];
        final band = OctaveBands.all[_bandIndex];

        return Scaffold(
          appBar: AppBar(
            title: const Text('Mapa'),
            actions: [
              if (points.isNotEmpty)
                IconButton(
                  icon: _exporting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.ios_share),
                  tooltip: 'Export FRD + JSON',
                  onPressed: _exporting ? null : _export,
                ),
            ],
          ),
          body: points.length < 2
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Text(
                      'Mapa potřebuje aspoň dva body. Projdi místnost '
                      'a průběžně měř.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: HeatmapView(
                          grid: interpolateBand(points, band),
                          points: points,
                          best: flattestListeningSpot(points),
                        ),
                      ),
                    ),
                    _BandSlider(
                      index: _bandIndex,
                      onChanged: (i) => setState(() => _bandIndex = i),
                    ),
                    _Summary(points: points),
                  ],
                ),
        );
      },
    );
  }

  Future<void> _export() async {
    final session = widget.state.session;
    final store = widget.store;
    if (session == null || store == null) return;

    setState(() => _exporting = true);
    try {
      // One FRD per point, plus the whole session as JSON. The FRDs are what
      // REW and VituixCAD read; the JSON is the only lossless copy, since FRD
      // has nowhere to put a position.
      final files = <XFile>[];
      for (final p in session.points) {
        final f = await store.writeExport(
          '${_slug(session.name)}_${p.id}.frd',
          FrdExport.fromMeasurement(p, session: session),
        );
        files.add(XFile(f.path));
      }
      final json = await store.writeExport(
        '${_slug(session.name)}.json',
        const JsonEncoder.withIndent('  ').convert(session.toJson()),
      );
      files.add(XFile(json.path));

      await SharePlus.instance.share(ShareParams(
        files: files,
        subject: 'AudioScanner — ${session.name}',
        text: 'FRD po bodech (import do REW / VituixCAD) a celá session v JSON.',
      ));
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  static String _slug(String s) =>
      s.replaceAll(RegExp(r'[^A-Za-z0-9_-]+'), '_');
}

class _BandSlider extends StatelessWidget {
  const _BandSlider({required this.index, required this.onChanged});

  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final band = OctaveBands.all[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            child: Text('${band.label} Hz',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            child: Slider(
              value: index.toDouble(),
              min: 0,
              max: (OctaveBands.all.length - 1).toDouble(),
              divisions: OctaveBands.all.length - 1,
              label: '${band.label} Hz',
              onChanged: (v) => onChanged(v.round()),
            ),
          ),
        ],
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.points});

  final List<Measurement> points;

  @override
  Widget build(BuildContext context) {
    final best = flattestListeningSpot(points);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Icon(Icons.chair_outlined,
              size: 18, color: Theme.of(context).colorScheme.tertiary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              best == null
                  ? '—'
                  : 'Nejrovnější místo: ${best.id} na ${best.position} m '
                      '(rozptyl ${best.variationDb().toStringAsFixed(1)} dB '
                      'v 40–300 Hz)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
