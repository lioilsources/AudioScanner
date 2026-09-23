import 'dart:math' as math;

import 'speaker_layout.dart';

/// Where a speaker's low-frequency limit came from. It decides how much the
/// crossover recommendation is worth, so it is never dropped from the report.
enum SpecBasis {
  /// Taken from the manufacturer's published −3 dB point.
  datasheet,

  /// Inferred from cabinet class and driver size. Good enough to pick a
  /// crossover, not good enough to quote as a specification.
  estimated,

  /// Read off an actual measurement made with this app.
  measured,
}

/// What a speaker can and cannot do, as far as bass management cares.
class SpeakerModel {
  const SpeakerModel({
    required this.name,
    required this.lowCutoffHz,
    required this.basis,
    this.isAtmosModule = false,
    this.note,
  });

  final String name;

  /// Roughly the −3 dB point. Everything below it the speaker is pretending.
  final double lowCutoffHz;
  final SpecBasis basis;

  /// Small Atmos enclosure. These get their own floor in the crossover rule:
  /// the cabinets are tiny, they sit on a wall or a ceiling where boundary gain
  /// flatters them, and Atmos objects routed to them are often full-range.
  final bool isAtmosModule;

  final String? note;
}

/// The crossover steps a DRX-8.4 actually offers. A recommendation the receiver
/// cannot be set to is not a recommendation.
const List<int> integraCrossovers = [
  40, 50, 60, 80, 90, 100, 110, 120, 150, 200
];

/// The highest crossover worth using in a main system.
///
/// Above roughly 120 Hz two things go wrong at once: the ear starts being able
/// to point at the subwoofer, and the fundamentals of a male voice begin
/// arriving from it instead of from the centre speaker. A speaker that would
/// need more than this to stay comfortable is a speaker that is too small for
/// the job — which is worth being told, rather than papering over with a
/// crossover that moves the problem into the subwoofer.
const int maxPracticalCrossover = 120;

/// Recommended crossover for a speaker.
///
/// Two rules, in this order:
///
/// 1. **Never below what the speaker can do.** The crossover goes about half an
///    octave above the −3 dB point, so the speaker is handed only what it can
///    actually reproduce. Sending 40 Hz to a cabinet that stops at 90 Hz does
///    not produce quiet bass — it produces distortion across everything else
///    the driver is trying to do at the same time.
///
/// 2. **Not below 80 Hz even when the speaker could.** 80 Hz is the THX and
///    Dolby reference for a reason: it is below the range that carries voices,
///    and it is low enough that the ear cannot point at the subwoofer. Running
///    big fronts full-range instead means the room's worst modes get excited
///    from two more positions, and those positions were chosen for imaging, not
///    for bass. One source of bass in one well-chosen place beats three.
///
/// [allowFullRange] lifts the second rule for a genuinely capable floorstander
/// when someone insists — the report still says what it costs.
int recommendedCrossover(SpeakerModel speaker, {bool allowFullRange = false}) {
  var target = speaker.lowCutoffHz * 1.5;

  if (speaker.isAtmosModule) {
    // Small sealed boxes over-promise: the published number is usually the
    // point where output has already collapsed. Keep them well clear of it.
    target = math.max(target, 100);
  } else if (!allowFullRange) {
    target = math.max(target, 80);
  }

  for (final step in integraCrossovers) {
    if (step >= target) {
      return math.min(step, maxPracticalCrossover);
    }
  }
  return maxPracticalCrossover;
}

/// True when the speaker would rather be crossed over higher than
/// [maxPracticalCrossover] allows — it will be working below its comfort zone
/// between its recommended crossover and where it actually rolls off.
bool isStretchedByCrossover(SpeakerModel speaker) {
  final wanted = speaker.lowCutoffHz * 1.5;
  return (speaker.isAtmosModule ? math.max(wanted, 100) : wanted) >
      maxPracticalCrossover;
}

/// The speakers in the diagram.
///
/// Every low-frequency figure here is [SpecBasis.estimated] — inferred from
/// cabinet class and driver size, not read off a datasheet. They are
/// deliberately conservative: overestimating what a small cabinet does is the
/// error that produces a 40 Hz crossover on an Atmos module, which is exactly
/// the mistake this file exists to prevent. Replace them with measured values
/// once a sweep has been run on each speaker, and the crossovers follow.
const Map<Channel, SpeakerModel> magnatSystem = {
  Channel.frontLeft: SpeakerModel(
    name: 'Magnat Monitor Supreme 1002 B',
    lowCutoffHz: 38,
    basis: SpecBasis.estimated,
    note: 'Třípásmový sloup — jediný repro v sestavě, co má smysl zvažovat '
        'jako full-range.',
  ),
  Channel.frontRight: SpeakerModel(
    name: 'Magnat Monitor Supreme 1002 B',
    lowCutoffHz: 38,
    basis: SpecBasis.estimated,
  ),
  Channel.center: SpeakerModel(
    name: 'Magnat Monitor Supreme Center S12 C',
    lowCutoffHz: 55,
    basis: SpecBasis.estimated,
    note: 'Center nese většinu dialogů — držet ho mimo pásmo, kde se dusí, '
        'je slyšet víc než kdekoli jinde.',
  ),
  Channel.surroundLeft: SpeakerModel(
    name: 'Magnat Monitor Supreme S10 B',
    lowCutoffHz: 60,
    basis: SpecBasis.estimated,
  ),
  Channel.surroundRight: SpeakerModel(
    name: 'Magnat Monitor Supreme S10 B',
    lowCutoffHz: 60,
    basis: SpecBasis.estimated,
  ),
  Channel.surroundBackLeft: SpeakerModel(
    name: 'Magnat Monitor S10D',
    lowCutoffHz: 60,
    basis: SpecBasis.estimated,
  ),
  Channel.surroundBackRight: SpeakerModel(
    name: 'Magnat Monitor S10D',
    lowCutoffHz: 60,
    basis: SpecBasis.estimated,
  ),
  Channel.heightFrontLeft: SpeakerModel(
    name: 'Magnat ATM 202 Black',
    lowCutoffHz: 90,
    basis: SpecBasis.estimated,
    isAtmosModule: true,
    note: 'Atmos modul — malá skříň, na basy nemá objem ani zdvih.',
  ),
  Channel.heightFrontRight: SpeakerModel(
    name: 'Magnat ATM 202 Black',
    lowCutoffHz: 90,
    basis: SpecBasis.estimated,
    isAtmosModule: true,
  ),
  Channel.heightRearLeft: SpeakerModel(
    name: 'Magnat ATM 202 Black',
    lowCutoffHz: 90,
    basis: SpecBasis.estimated,
    isAtmosModule: true,
  ),
  Channel.heightRearRight: SpeakerModel(
    name: 'Magnat ATM 202 Black',
    lowCutoffHz: 90,
    basis: SpecBasis.estimated,
    isAtmosModule: true,
  ),
};
