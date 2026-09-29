import '../export/avr_config.dart';
import '../dsp/octave_bands.dart';
import 'measurement.dart';
import 'mic_calibration.dart';

/// How the room was excited while a session was recorded.
enum ExcitationSignal {
  /// Pink noise from the phone's own speaker. Convenient, and nearly useless
  /// for judging a room: the phone speaker rolls off long before the modes it
  /// would need to excite.
  phonePinkNoise,

  /// Pink noise played through the speakers being measured.
  externalPinkNoise,

  /// Log sweep through the speakers. The only one that yields an impulse
  /// response, and therefore the only one phase 3 can work with.
  externalSweep;

  bool get supportsImpulseResponse => this == ExcitationSignal.externalSweep;

  String get label => switch (this) {
        ExcitationSignal.phonePinkNoise => 'Růžový šum z telefonu',
        ExcitationSignal.externalPinkNoise => 'Růžový šum z beden',
        ExcitationSignal.externalSweep => 'Sweep z beden',
      };
}

/// A measurement run: one room, one speaker setup, many points.
class Session {
  Session({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.signal,
    this.sampleRate = 48000,
    this.calibrationOffsetDb = 0,
    List<Measurement>? points,
    this.note,
    this.target = const TargetCurve(),
    this.calibration,
  }) : points = points ?? [];

  /// The microphone's response file, if one was loaded. Applied on the way
  /// out (display, export), never to [points].
  MicCalibration? calibration;

  /// The response the EQ aims for. Mutable: it is the one thing the user
  /// tunes by ear after the measurement is done.
  TargetCurve target;

  final String id;
  final String name;
  final DateTime createdAt;
  final ExcitationSignal signal;
  final double sampleRate;

  /// Manual offset added to displayed levels so the numbers can be lined up
  /// with a real SPL meter. Stored, never applied to the raw data: it is a
  /// display convenience and must not quietly become part of a measurement.
  double calibrationOffsetDb;

  /// Whether displayed levels can be called an SPL estimate at all.
  bool get hasSplOffset => calibrationOffsetDb != 0;

  /// [bands] with the microphone taken out and the SPL offset put in.
  ///
  /// The one place corrections are applied to band data. Everything that
  /// shows or exports a point goes through here, so a calibration loaded
  /// later corrects every existing point the same way.
  List<double> correctedBands(List<double> bands) {
    final cal = calibration;
    return [
      for (var i = 0; i < bands.length; i++)
        bands[i] +
            calibrationOffsetDb +
            (cal == null ? 0 : cal.correctionAt(OctaveBands.all[i].nominal)),
    ];
  }

  /// Same for a full-resolution curve.
  List<double> correctedCurve(List<double> frequencies, List<double> levelsDb) {
    final cal = calibration;
    if (cal == null && calibrationOffsetDb == 0) return levelsDb;
    return [
      for (var i = 0; i < frequencies.length; i++)
        levelsDb[i] +
            calibrationOffsetDb +
            (cal == null ? 0 : cal.correctionAt(frequencies[i])),
    ];
  }

  /// A copy of [m] with corrected bands, for code that works on points.
  Measurement corrected(Measurement m) => Measurement(
        id: m.id,
        position: m.position,
        timestamp: m.timestamp,
        bandsDb: correctedBands(m.bandsDb),
        rmsDbfs: m.rmsDbfs + calibrationOffsetDb,
        arAccuracy: m.arAccuracy,
        note: m.note,
        channel: m.channel,
        impulse: m.impulse,
        afterEq: m.afterEq,
      );

  List<Measurement> get correctedPoints => [for (final p in points) corrected(p)];
  List<Measurement> get correctedMapPoints =>
      [for (final p in mapPoints) corrected(p)];

  /// One line for an export header saying what was applied.
  String? get correctionNote {
    final parts = <String>[];
    final cal = calibration;
    if (cal != null) {
      parts.add('microphone calibration "${cal.name}" (${cal.points.length} '
          'points, ${cal.minDb.toStringAsFixed(1)} … '
          '${cal.maxDb.toStringAsFixed(1)} dB) subtracted');
    }
    if (calibrationOffsetDb != 0) {
      parts.add('SPL offset ${calibrationOffsetDb >= 0 ? '+' : ''}'
          '${calibrationOffsetDb.toStringAsFixed(1)} dB added — levels are an '
          'SPL estimate');
    }
    return parts.isEmpty ? null : parts.join('; ');
  }

  final List<Measurement> points;
  final String? note;

  /// The reference point every other level is quoted against — the first one
  /// taken, which the flow puts at the listening position.
  Measurement? get reference => mapPoints.isEmpty ? null : mapPoints.first;

  /// Points of the room walk: the ones the heatmap is made of.
  ///
  /// Channel measurements are excluded on purpose. They are taken from the
  /// seat with a sweep, on a level scale of their own, and one of them dropped
  /// into an IDW surface of noise readings would sit there as a false peak.
  List<Measurement> get mapPoints =>
      [for (final p in points) if (p.channel == null) p];

  /// Measurements taken for a receiver channel, latest per channel first.
  List<Measurement> get channelPoints =>
      [for (final p in points) if (p.channel != null) p];

  /// The most recent measurement for [channel], preferring one taken before
  /// EQ unless [afterEq] asks for the verification pass.
  Measurement? latestFor(String channel, {bool afterEq = false}) {
    Measurement? best;
    for (final p in points) {
      if (p.channel != channel || p.afterEq != afterEq) continue;
      if (best == null || p.timestamp.isAfter(best.timestamp)) best = p;
    }
    return best;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'createdAt': createdAt.toIso8601String(),
        'signal': signal.name,
        'sampleRate': sampleRate,
        'calibrationOffsetDb': calibrationOffsetDb,
        'points': [for (final p in points) p.toJson()],
        if (note != null) 'note': note,
        'target': target.toJson(),
        if (calibration != null) 'calibration': calibration!.toJson(),
        'format': 'audioscanner.session/1',
      };

  factory Session.fromJson(Map<String, dynamic> j) => Session(
        id: j['id'] as String,
        name: j['name'] as String,
        createdAt: DateTime.parse(j['createdAt'] as String),
        signal: ExcitationSignal.values.firstWhere(
          (s) => s.name == j['signal'],
          orElse: () => ExcitationSignal.externalSweep,
        ),
        sampleRate: (j['sampleRate'] as num?)?.toDouble() ?? 48000,
        calibrationOffsetDb:
            (j['calibrationOffsetDb'] as num?)?.toDouble() ?? 0,
        points: [
          for (final p in (j['points'] as List? ?? []))
            Measurement.fromJson(p as Map<String, dynamic>),
        ],
        note: j['note'] as String?,
        target: j['target'] == null
            ? const TargetCurve()
            : TargetCurve.fromJson(j['target'] as Map<String, dynamic>),
        calibration: j['calibration'] == null
            ? null
            : MicCalibration.fromJson(j['calibration'] as Map<String, dynamic>),
      );
}
