import 'measurement.dart';

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
  }) : points = points ?? [];

  final String id;
  final String name;
  final DateTime createdAt;
  final ExcitationSignal signal;
  final double sampleRate;

  /// Manual offset added to displayed levels so the numbers can be lined up
  /// with a real SPL meter. Stored, never applied to the raw data: it is a
  /// display convenience and must not quietly become part of a measurement.
  final double calibrationOffsetDb;

  final List<Measurement> points;
  final String? note;

  /// The reference point every other level is quoted against — the first one
  /// taken, which the flow puts at the listening position.
  Measurement? get reference => points.isEmpty ? null : points.first;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'createdAt': createdAt.toIso8601String(),
        'signal': signal.name,
        'sampleRate': sampleRate,
        'calibrationOffsetDb': calibrationOffsetDb,
        'points': [for (final p in points) p.toJson()],
        if (note != null) 'note': note,
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
      );
}
