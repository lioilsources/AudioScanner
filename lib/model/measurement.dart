import 'dart:math' as math;

import '../dsp/impulse_response.dart';
import '../dsp/octave_bands.dart';

/// A position in the room, in metres, relative to the session origin.
///
/// ARKit's axes as taken at origin time: x right, y up, z toward the viewer.
/// Only position is ever stored. The phone's orientation is deliberately not
/// part of a measurement — a single omni microphone cannot tell where a sound
/// came from, and recording a heading would invite a map that claims it can.
class Vec3 {
  const Vec3(this.x, this.y, this.z);

  final double x;
  final double y;
  final double z;

  static const zero = Vec3(0, 0, 0);

  /// Distance in the floor plane, ignoring height — the distance that matters
  /// for a 2-D plan heatmap.
  double planarDistanceTo(Vec3 o) =>
      math.sqrt(math.pow(x - o.x, 2) + math.pow(z - o.z, 2));

  double distanceTo(Vec3 o) => math.sqrt(
      math.pow(x - o.x, 2) + math.pow(y - o.y, 2) + math.pow(z - o.z, 2));

  Map<String, dynamic> toJson() => {'x': x, 'y': y, 'z': z};

  factory Vec3.fromJson(Map<String, dynamic> j) =>
      Vec3((j['x'] as num).toDouble(), (j['y'] as num).toDouble(),
          (j['z'] as num).toDouble());

  @override
  String toString() =>
      '(${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)}, ${z.toStringAsFixed(2)})';
}

/// What an impulse response said, kept with the point it was taken at.
///
/// The response itself is too large for the session file (ten seconds at
/// 48 kHz is two million samples) and lives in a sidecar named by [file]; this
/// is the part that has to survive without it — enough to draw the map, feed
/// the design report and compare channels after a restart.
class ImpulseSummary {
  const ImpulseSummary({
    required this.arrivalMs,
    required this.gateMs,
    required this.gatedBandsDb,
    this.firstReflectionMs,
    this.rt20,
    this.rt30,
    this.file,
  });

  /// From the recording start to the direct sound: playback latency plus
  /// flight time. Only differences between channels mean anything.
  final double arrivalMs;
  final double? firstReflectionMs;
  final Duration? rt20;
  final Duration? rt30;

  /// Gate the [gatedBandsDb] were taken with.
  final double gateMs;

  /// 1/3-octave levels of the gated (direct-sound) response.
  final List<double> gatedBandsDb;

  /// Sidecar file holding the full response, relative to the session store.
  final String? file;

  factory ImpulseSummary.from(
    ImpulseResponse ir, {
    Duration gate = const Duration(milliseconds: 5),
    String? file,
  }) {
    final gated = ir.gated(window: gate);
    final (freqs, levels) = gated.frequencyResponse();
    final reflection = ir.firstReflectionIndex();
    double ms(int samples) => samples / ir.sampleRate * 1000;
    return ImpulseSummary(
      arrivalMs: ms(ir.directSoundIndex),
      firstReflectionMs:
          reflection == null ? null : ms(reflection - ir.directSoundIndex),
      rt20: ir.rt60(decayDb: 20),
      rt30: ir.rt60(decayDb: 30),
      gateMs: gate.inMicroseconds / 1000,
      gatedBandsDb: bandMeansFromTransferDb(levels, binHz: freqs[1]),
      file: file,
    );
  }

  Map<String, dynamic> toJson() => {
        'arrivalMs': arrivalMs,
        if (firstReflectionMs != null) 'firstReflectionMs': firstReflectionMs,
        if (rt20 != null) 'rt20Ms': rt20!.inMilliseconds,
        if (rt30 != null) 'rt30Ms': rt30!.inMilliseconds,
        'gateMs': gateMs,
        'gatedBandsDb': gatedBandsDb,
        if (file != null) 'file': file,
      };

  factory ImpulseSummary.fromJson(Map<String, dynamic> j) => ImpulseSummary(
        arrivalMs: (j['arrivalMs'] as num).toDouble(),
        firstReflectionMs: (j['firstReflectionMs'] as num?)?.toDouble(),
        rt20: j['rt20Ms'] == null
            ? null
            : Duration(milliseconds: (j['rt20Ms'] as num).round()),
        rt30: j['rt30Ms'] == null
            ? null
            : Duration(milliseconds: (j['rt30Ms'] as num).round()),
        gateMs: (j['gateMs'] as num).toDouble(),
        gatedBandsDb: [
          for (final v in j['gatedBandsDb'] as List) (v as num).toDouble()
        ],
        file: j['file'] as String?,
      );
}

/// One measurement point: where the phone was, and what it heard there.
class Measurement {
  Measurement({
    required this.id,
    required this.position,
    required this.timestamp,
    required this.bandsDb,
    required this.rmsDbfs,
    this.arAccuracy,
    this.note,
    this.channel,
    this.impulse,
    this.afterEq = false,
  });

  final String id;
  final Vec3 position;
  final DateTime timestamp;

  /// The receiver channel this point was taken for, as a [Channel] name, or
  /// null for a point of the room walk. The design report keys its
  /// per-channel work on this and on nothing else — matching on ids was the
  /// bug that left every real session without an EQ.
  final String? channel;

  /// Present when the point came from a sweep rather than averaged noise.
  final ImpulseSummary? impulse;

  /// Taken after the generated EQ was entered into the receiver, to verify it.
  final bool afterEq;

  /// 1/3-octave levels aligned with [OctaveBands.all], in dB relative to full
  /// scale. Not SPL: the phone's microphone is uncalibrated, so only
  /// differences between points carry meaning.
  final List<double> bandsDb;
  final double rmsDbfs;

  /// ARKit's own confidence in the pose when this point was taken, if known.
  final String? arAccuracy;
  final String? note;

  double levelAt(OctaveBand band) {
    final i = OctaveBands.all.indexWhere((b) => b.index == band.index);
    return i < 0 ? -160 : bandsDb[i];
  }

  /// Spread of the response across a frequency range, in dB.
  ///
  /// The plan's "flattest seat" metric: standard deviation of the band levels
  /// between [low] and [high]. Low is flat, high means peaks and nulls.
  double variationDb({double low = 40, double high = 300}) {
    final bands = OctaveBands.inRange(low, high);
    if (bands.isEmpty) return 0;
    final levels = [for (final b in bands) levelAt(b)];
    final mean = levels.reduce((a, b) => a + b) / levels.length;
    final variance =
        levels.map((l) => math.pow(l - mean, 2)).reduce((a, b) => a + b) /
            levels.length;
    return math.sqrt(variance);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'position': position.toJson(),
        'timestamp': timestamp.toIso8601String(),
        'bandsDb': bandsDb,
        'rmsDbfs': rmsDbfs,
        if (arAccuracy != null) 'arAccuracy': arAccuracy,
        if (note != null) 'note': note,
        if (channel != null) 'channel': channel,
        if (impulse != null) 'impulse': impulse!.toJson(),
        if (afterEq) 'afterEq': true,
      };

  factory Measurement.fromJson(Map<String, dynamic> j) => Measurement(
        id: j['id'] as String,
        position: Vec3.fromJson(j['position'] as Map<String, dynamic>),
        timestamp: DateTime.parse(j['timestamp'] as String),
        bandsDb: [for (final v in j['bandsDb'] as List) (v as num).toDouble()],
        rmsDbfs: (j['rmsDbfs'] as num).toDouble(),
        arAccuracy: j['arAccuracy'] as String?,
        note: j['note'] as String?,
        channel: j['channel'] as String?,
        impulse: j['impulse'] == null
            ? null
            : ImpulseSummary.fromJson(j['impulse'] as Map<String, dynamic>),
        afterEq: j['afterEq'] == true,
      );
}
