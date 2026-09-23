import 'dart:math' as math;

import '../room/room_geometry.dart';
import '../room/speaker_layout.dart';
import '../room/speaker_model.dart';

/// The Integra DRX-8.4's manual equaliser, band for band.
///
/// Full-range channels get fifteen bands; the subwoofer channel gets the first
/// five and nothing above 160 Hz. Generating anything else produces a preset
/// that cannot be typed into the receiver.
const List<double> integraEqBands = [
  25, 40, 63, 100, 160, 250, 400, 630, 1000, 1600, 2500, 4000, 6300, 10000, 16000
];
const List<double> integraSubEqBands = [25, 40, 63, 100, 160];

/// The receiver's own limits on a band.
const double integraEqMaxBoostDb = 12;
const double integraEqMaxCutDb = -12;
const double integraEqStepDb = 0.5;

/// Distance and level trim resolution.
const double integraDistanceStepM = 0.01;
const double integraLevelStepDb = 0.5;

/// The response the system is aimed at.
///
/// Not flat. A room measured with an omnidirectional microphone reads brighter
/// than it sounds, because above a few kilohertz the ear hears mostly the
/// direct sound while the microphone sums in every reflection. Flattening that
/// measurement produces a system that is audibly dull. The usual answer, and
/// the one here, is a gentle downward tilt above 1 kHz plus a modest lift at
/// the bottom, which is what listeners pick in blind comparisons.
class TargetCurve {
  const TargetCurve({
    this.bassLiftDb = 4,
    this.bassLiftBelowHz = 80,
    this.tiltDbPerOctave = -0.8,
    this.tiltAboveHz = 1000,
  });

  final double bassLiftDb;
  final double bassLiftBelowHz;
  final double tiltDbPerOctave;
  final double tiltAboveHz;

  /// Flat everywhere — for someone who wants to hear the tilt argument for
  /// themselves rather than take it on trust.
  static const flat = TargetCurve(bassLiftDb: 0, tiltDbPerOctave: 0);

  double levelAt(double hz) {
    var db = 0.0;
    if (hz < bassLiftBelowHz) {
      // Shelf, not a step: a discontinuity at 80 Hz would be audible as a seam.
      final octavesBelow = math.log(bassLiftBelowHz / hz) / math.ln2;
      db += bassLiftDb * math.min(1.0, octavesBelow / 1.5);
    }
    if (hz > tiltAboveHz) {
      db += tiltDbPerOctave * (math.log(hz / tiltAboveHz) / math.ln2);
    }
    return db;
  }
}

/// One channel's generated equaliser preset.
class EqPreset {
  const EqPreset({required this.bands, required this.gainsDb, this.notes = const []});

  final List<double> bands;
  final List<double> gainsDb;
  final List<String> notes;
}

/// Turns a measured response into an Integra preset.
///
/// Three rules, and the second is the one that matters:
///
/// 1. Work on the difference between what was measured and the target curve.
/// 2. **Cut freely, boost barely.** A peak is energy the room added and can be
///    taken away. A null is energy that cancelled — boosting it sends the
///    amplifier into the same cancellation with more power and gets a hotter
///    amplifier, not more bass. [maxBoostDb] is deliberately small.
/// 3. Leave everything above [maxEqHz] alone. Above the Schroeder frequency
///    a single-point measurement describes that one point, not the room;
///    equalising it makes every other seat worse.
EqPreset generateEq({
  required List<double> measuredBandsDb,
  required List<double> measuredBandCenters,
  TargetCurve target = const TargetCurve(),
  List<double> outputBands = integraEqBands,
  double maxBoostDb = 3,
  double maxEqHz = 300,
  double? referenceLevelDb,
}) {
  // Anchor at the midband so the preset corrects shape and leaves overall
  // level to the channel trim, which has far more range.
  final anchor = referenceLevelDb ??
      _interpolate(measuredBandCenters, measuredBandsDb, 1000);

  final gains = <double>[];
  final notes = <String>[];

  for (final hz in outputBands) {
    if (hz > maxEqHz) {
      gains.add(0);
      continue;
    }
    final measured =
        _interpolate(measuredBandCenters, measuredBandsDb, hz) - anchor;
    var correction = target.levelAt(hz) - measured;

    if (correction > maxBoostDb) {
      if (correction > maxBoostDb + 3) {
        notes.add('${_hz(hz)}: propad ${(-correction).toStringAsFixed(1)} dB '
            'se nevyrovnává — je to interference, ne nedostatek výkonu. '
            'Řeší se posunem repro nebo posluchače.');
      }
      correction = maxBoostDb;
    }
    correction = correction.clamp(integraEqMaxCutDb, integraEqMaxBoostDb);
    gains.add((correction / integraEqStepDb).round() * integraEqStepDb);
  }

  return EqPreset(bands: outputBands, gainsDb: gains, notes: notes);
}

double _interpolate(List<double> xs, List<double> ys, double x) {
  if (xs.isEmpty) return 0;
  if (x <= xs.first) return ys.first;
  if (x >= xs.last) return ys.last;
  for (var i = 1; i < xs.length; i++) {
    if (x <= xs[i]) {
      // Interpolate on a log frequency axis — halfway between 63 and 100 Hz is
      // 79 Hz, not 81.5.
      final t = math.log(x / xs[i - 1]) / math.log(xs[i] / xs[i - 1]);
      return ys[i - 1] + (ys[i] - ys[i - 1]) * t;
    }
  }
  return ys.last;
}

String _hz(double hz) =>
    hz >= 1000 ? '${(hz / 1000).toStringAsFixed(hz % 1000 == 0 ? 0 : 1)} kHz' : '${hz.toStringAsFixed(0)} Hz';

/// One channel's complete settings.
class ChannelConfig {
  const ChannelConfig({
    required this.channel,
    required this.speaker,
    required this.distanceM,
    required this.crossoverHz,
    required this.levelDb,
    this.eq,
    this.warnings = const [],
  });

  final Channel channel;
  final SpeakerModel? speaker;
  final double distanceM;
  final int crossoverHz;
  final double levelDb;
  final EqPreset? eq;
  final List<String> warnings;
}

/// The whole receiver setup, ready to be typed in.
class AvrConfig {
  AvrConfig({
    required this.channels,
    required this.lpfOfLfeHz,
    required this.room,
    this.globalNotes = const [],
  });

  final List<ChannelConfig> channels;
  final int lpfOfLfeHz;
  final RoomGeometry room;
  final List<String> globalNotes;

  /// Renders the config as a sheet to work through at the receiver.
  String render() {
    final b = StringBuffer();
    b.writeln('AudioScanner — návrh konfigurace');
    b.writeln('Místnost ${room.length.toStringAsFixed(2)} × '
        '${room.width.toStringAsFixed(2)} × ${room.height.toStringAsFixed(2)} m '
        '(${room.volume.toStringAsFixed(1)} m³), '
        'RT60 ${room.rt60.toStringAsFixed(2)} s');
    b.writeln('Schroederova frekvence '
        '${room.schroederFrequency.toStringAsFixed(0)} Hz — nad ní je '
        'jednobodové měření o tom bodě, ne o místnosti, a EQ se tam nedělá.');
    b.writeln();

    b.writeln('── Distance / Crossover / Level ${'─' * 24}');
    b.writeln('${"Kanál".padRight(30)}${"Vzdál.".padLeft(8)}'
        '${"Xover".padLeft(8)}${"Level".padLeft(9)}');
    for (final c in channels) {
      b.writeln('${c.channel.label.padRight(30)}'
          '${"${c.distanceM.toStringAsFixed(2)} m".padLeft(8)}'
          '${(c.channel == Channel.subwoofer ? "—" : "${c.crossoverHz} Hz").padLeft(8)}'
          '${"${c.levelDb >= 0 ? "+" : ""}${c.levelDb.toStringAsFixed(1)} dB".padLeft(9)}');
    }
    b.writeln('${"LPF of LFE".padRight(30)}${"$lpfOfLfeHz Hz".padLeft(25)}');
    b.writeln();

    final withEq = channels.where((c) => c.eq != null);
    if (withEq.isNotEmpty) {
      b.writeln('── Equalizer Settings (Preset 1) ${'─' * 23}');
      for (final c in withEq) {
        final eq = c.eq!;
        if (eq.gainsDb.every((g) => g == 0)) continue;
        b.writeln(c.channel.label);
        for (var i = 0; i < eq.bands.length; i++) {
          if (eq.gainsDb[i] == 0) continue;
          b.writeln('  ${_hz(eq.bands[i]).padRight(10)}'
              '${eq.gainsDb[i] >= 0 ? "+" : ""}'
              '${eq.gainsDb[i].toStringAsFixed(1)} dB');
        }
      }
      b.writeln();
    }

    final warned = channels.where((c) => c.warnings.isNotEmpty);
    if (warned.isNotEmpty) {
      b.writeln('── Na co si dát pozor ${'─' * 34}');
      for (final c in warned) {
        for (final w in c.warnings) {
          b.writeln('· ${c.channel.label}: $w');
        }
      }
      b.writeln();
    }

    if (globalNotes.isNotEmpty) {
      b.writeln('── Nastavení mimo kanály ${'─' * 31}');
      for (final n in globalNotes) {
        b.writeln('· $n');
      }
    }
    return b.toString();
  }

  Map<String, dynamic> toJson() => {
        'format': 'audioscanner.avrconfig/1',
        'room': {
          'length': room.length,
          'width': room.width,
          'height': room.height,
          'rt60': room.rt60,
          'schroederHz': room.schroederFrequency,
        },
        'lpfOfLfeHz': lpfOfLfeHz,
        'channels': [
          for (final c in channels)
            {
              'channel': c.channel.name,
              'speaker': c.speaker?.name,
              'distanceM': c.distanceM,
              'crossoverHz': c.crossoverHz,
              'levelDb': c.levelDb,
              if (c.eq != null)
                'eq': {
                  for (var i = 0; i < c.eq!.bands.length; i++)
                    c.eq!.bands[i].toString(): c.eq!.gainsDb[i],
                },
              if (c.warnings.isNotEmpty) 'warnings': c.warnings,
            }
        ],
        'notes': globalNotes,
      };
}

/// Sets the LFE low-pass from the highest crossover in the system.
///
/// The LFE channel and the bass management output share the subwoofer. Leaving
/// LPF of LFE at 120 Hz while the speakers hand over at 100 is the common case
/// and is fine; setting it *below* the highest crossover digs a hole in the
/// handover that no channel covers.
int lpfOfLfeFor(Iterable<int> crossovers) {
  final highest = crossovers.fold(0, math.max);
  return math.max(120, highest);
}
