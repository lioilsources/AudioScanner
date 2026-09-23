import 'dart:math' as math;

import '../dsp/octave_bands.dart';
import '../export/avr_config.dart';
import '../model/measurement.dart';
import 'placement.dart';
import 'room_geometry.dart';
import 'room_modes.dart';
import 'speaker_layout.dart';
import 'speaker_model.dart';

/// Everything the app can work out about a room and a set of speakers in it.
///
/// The point of putting geometry and measurement together is that neither is
/// enough on its own. A measurement says *what* is wrong at the seat but not
/// why, and offers no way to tell a mode from a boundary cancellation from a
/// speaker that is simply out of its depth. Geometry predicts all three and
/// knows none of them happened. Crossed, they name causes — and a cause is the
/// difference between "cut 6 dB at 63 Hz" and "move the sofa 40 cm forward".
class DesignReport {
  DesignReport({
    required this.room,
    required this.seat,
    required this.speakers,
    required this.modes,
    required this.angleChecks,
    required this.symmetry,
    required this.subwooferCandidates,
    required this.seatCandidates,
    required this.boundaryIssues,
    required this.reflections,
    required this.config,
    required this.findings,
  });

  final RoomGeometry room;
  final RoomPoint seat;
  final List<SpeakerPlacement> speakers;
  final List<RoomMode> modes;
  final List<AngleCheck> angleChecks;
  final List<SymmetryIssue> symmetry;
  final List<PlacementCandidate> subwooferCandidates;
  final List<PlacementCandidate> seatCandidates;
  final Map<Channel, List<BoundaryNull>> boundaryIssues;
  final Map<Channel, List<ReflectionPoint>> reflections;
  final AvrConfig config;

  /// Ordered worst first — what to actually go and do.
  final List<Finding> findings;

  /// The dominant axial modes, which are the ones worth naming out loud.
  List<RoomMode> get axialModes =>
      modes.where((m) => m.type == ModeType.axial).take(6).toList();
}

enum Severity { critical, important, worthDoing }

class Finding {
  const Finding({
    required this.severity,
    required this.title,
    required this.detail,
    this.action,
  });

  final Severity severity;
  final String title;
  final String detail;
  final String? action;
}

/// Builds the report.
///
/// [measurements] are optional: with none, everything geometric still works and
/// the levels fall back to zero trim. That matters because the geometry half is
/// available the moment the room is scanned, before a single sweep has been
/// played.
DesignReport buildDesignReport({
  required RoomGeometry room,
  required RoomPoint seat,
  required List<SpeakerPlacement> speakers,
  Map<Channel, SpeakerModel> models = magnatSystem,
  List<Measurement> measurements = const [],
  double forward = 0,
  TargetCurve target = const TargetCurve(),
  bool allowFullRangeFronts = false,
}) {
  final modes = modesBelow(room, maxHz: 200);
  final findings = <Finding>[];

  // --- geometry the user cannot change, but should know about ---------------

  final proportion = room.proportionWarning();
  if (proportion != null) {
    findings.add(Finding(
      severity: Severity.worthDoing,
      title: 'Poměr stran místnosti stohuje módy',
      detail: proportion,
      action: 'S tímhle se nedá nic dělat bez bourání — ber to jako důvod, '
          'proč bude jeden konkrétní hrb odolávat všemu ostatnímu.',
    ));
  }

  // --- angles ---------------------------------------------------------------

  final angleChecks = [
    for (final s in speakers) checkAngle(s, seat: seat, forward: forward)
  ];
  for (final check in angleChecks.where((c) => !c.withinSpec)) {
    findings.add(Finding(
      severity: check.channel.isHeight ? Severity.important : Severity.critical,
      title: '${check.channel.label} je mimo Dolby okno',
      detail: check.advice ?? '',
      action: 'Úhel se nedá dohnat zpožděním ani hlasitostí — objekt, který '
          'má proletět nad hlavou, vyletí jinde.',
    ));
  }

  final symmetry = symmetryIssues(speakers, seat: seat, forward: forward);
  for (final issue in symmetry) {
    findings.add(Finding(
      severity: Severity.important,
      title: 'Pár ${issue.left.label} / ${issue.right.label} není symetrický',
      detail: 'Rozdíl vzdálenosti ${issue.distanceDifference.toStringAsFixed(2)} m, '
          'úhlu ${issue.azimuthDifference.toStringAsFixed(0)}°.',
      action: 'Distance a level trim to srovnají v jednom bodě a v tabulce to '
          'bude vypadat dobře — ale každý repro pořád vidí jinou stěnu jinak '
          'daleko, takže odrazy a nabuzení basu zůstanou rozdílné.',
    ));
  }

  // --- boundaries -----------------------------------------------------------

  final boundaryIssues = <Channel, List<BoundaryNull>>{};
  for (final s in speakers) {
    final nulls = boundaryNulls(room, s.position);
    if (nulls.isEmpty) continue;
    boundaryIssues[s.channel] = nulls;
    final worst = nulls.first;
    if (worst.frequency >= 60 && worst.frequency <= 250) {
      findings.add(Finding(
        severity: Severity.important,
        title: '${s.channel.label}: propad kolem '
            '${worst.frequency.toStringAsFixed(0)} Hz od stěny',
        detail: 'Repro je ${worst.distance.toStringAsFixed(2)} m od '
            '${worst.boundary.label}; odraz se vrací v protifázi a ruší '
            'čtvrtvlnu na ${worst.frequency.toStringAsFixed(0)} Hz.',
        action: 'Posunout repro od té plochy (nebo těsně k ní) — '
            'ekvalizér tenhle propad nevyrovná, jen do něj pošle víc výkonu.',
      ));
    }
  }

  // --- reflections ----------------------------------------------------------

  final reflections = <Channel, List<ReflectionPoint>>{};
  for (final s in speakers.where((s) =>
      s.channel == Channel.frontLeft ||
      s.channel == Channel.frontRight ||
      s.channel == Channel.center)) {
    reflections[s.channel] =
        firstReflections(room, speaker: s.position, listener: seat);
  }

  // --- placement searches ---------------------------------------------------

  final sub = speakers.where((s) => s.channel == Channel.subwoofer).firstOrNull;
  final subPos = sub?.position ?? RoomPoint(room.length * 0.15, room.width * 0.15, 0.3);

  final subCandidates = rankSubwooferPositions(room, seat: seat);
  final seatCandidates = rankListeningPositions(room, subwoofer: subPos);

  final currentSubFlatness = flatnessDb(modalResponseDb(
    room,
    source: subPos,
    receiver: seat,
    frequencies: bassFrequencies(to: 120),
    modes: modes,
  ));
  if (subCandidates.isNotEmpty &&
      currentSubFlatness - subCandidates.first.flatnessDb > 1.5) {
    findings.add(Finding(
      severity: Severity.critical,
      title: 'Subwoofer stojí na horším místě, než je potřeba',
      detail: 'Tam, kde je teď, vychází rozptyl basu '
          '${currentSubFlatness.toStringAsFixed(1)} dB. Na '
          '${subCandidates.first.position} by to bylo '
          '${subCandidates.first.flatnessDb.toStringAsFixed(1)} dB.',
      action: 'Zisk ${(currentSubFlatness - subCandidates.first.flatnessDb).toStringAsFixed(1)} dB '
          'rozptylu zadarmo — žádný ekvalizér tohle nedokáže, protože nulu '
          'vyrovnat nejde.',
    ));
  }

  final currentSeatFlatness = currentSubFlatness;
  if (seatCandidates.isNotEmpty &&
      currentSeatFlatness - seatCandidates.first.flatnessDb > 2.0) {
    findings.add(Finding(
      severity: Severity.important,
      title: 'Posluchačské místo sedí v horším bodě, než musí',
      detail: 'Na ${seatCandidates.first.position} vychází rozptyl '
          '${seatCandidates.first.flatnessDb.toStringAsFixed(1)} dB '
          'proti dnešním ${currentSeatFlatness.toStringAsFixed(1)} dB.',
      action: 'Posunout pohovku bývá levnější a účinnější než cokoli jiného.',
    ));
  }

  // --- per-channel config ---------------------------------------------------

  final byChannel = {for (final m in measurements) m.id: m};
  final channels = <ChannelConfig>[];
  final crossovers = <int>[];

  for (final s in speakers) {
    if (s.channel == Channel.subwoofer) continue;
    final model = models[s.channel];
    final check = angleChecks.firstWhere((c) => c.channel == s.channel);
    final warnings = <String>[];

    final xo = model == null
        ? 80
        : recommendedCrossover(model,
            allowFullRange: allowFullRangeFronts &&
                (s.channel == Channel.frontLeft ||
                    s.channel == Channel.frontRight));
    crossovers.add(xo);

    if (model != null && model.basis == SpecBasis.estimated) {
      warnings.add('Dělicí kmitočet vychází z odhadu spodní hranice '
          '(${model.lowCutoffHz.toStringAsFixed(0)} Hz), ne z datasheetu — '
          'po změření sweepu na tomhle repru se to dá upřesnit.');
    }
    if (model != null && isStretchedByCrossover(model)) {
      warnings.add('Tenhle repro by chtěl dělit výš než $maxPracticalCrossover Hz, '
          'ale výš už je subwoofer slyšet jako zdroj a tahá si k sobě mužský '
          'hlas. Zůstává na $maxPracticalCrossover Hz a kousek pod svým '
          'komfortem — hlídej si hlasitost, ne ekvalizér.');
    }
    if (model?.note != null) warnings.add(model!.note!);

    channels.add(ChannelConfig(
      channel: s.channel,
      speaker: model,
      distanceM: (check.distance / integraDistanceStepM).round() *
          integraDistanceStepM,
      crossoverHz: xo,
      levelDb: _levelFor(byChannel, s.channel),
      eq: _eqFor(byChannel, s.channel, target, room),
      warnings: warnings,
    ));
  }

  if (sub != null) {
    channels.add(ChannelConfig(
      channel: Channel.subwoofer,
      speaker: null,
      distanceM: sub.position.distanceTo(seat),
      crossoverHz: 0,
      levelDb: 0,
      warnings: const [],
    ));
  }

  final globalNotes = <String>[
    'Speaker Virtualizer: Off. Se čtyřmi skutečnými výškovými repro nemá co '
        'dodat a jen rozmazává, co ATM 202 hrají doopravdy.',
    'Loudness Plus: Off při kritickém poslechu — mění tonální vyvážení podle '
        'hlasitosti, takže každé měření platí jen pro jednu polohu knoflíku.',
    'LPF of LFE: ${lpfOfLfeFor(crossovers)} Hz — nikdy níž než nejvyšší '
        'dělicí kmitočet v sestavě, jinak vznikne díra v předávce.',
    'EQ for Standing Wave nech vypnuté, dokud nemáš změřené módy — '
        'tenhle nástroj pracuje s pásmy z měření a dělá totéž adresněji.',
  ];

  findings.sort((a, b) => a.severity.index.compareTo(b.severity.index));

  return DesignReport(
    room: room,
    seat: seat,
    speakers: speakers,
    modes: modes,
    angleChecks: angleChecks,
    symmetry: symmetry,
    subwooferCandidates: subCandidates.take(5).toList(),
    seatCandidates: seatCandidates.take(5).toList(),
    boundaryIssues: boundaryIssues,
    reflections: reflections,
    config: AvrConfig(
      channels: channels,
      lpfOfLfeHz: lpfOfLfeFor(crossovers),
      room: room,
      globalNotes: globalNotes,
    ),
    findings: findings,
  );
}

double _levelFor(Map<String, Measurement> byChannel, Channel channel) {
  final m = byChannel[channel.name];
  if (m == null) return 0;
  // Trim toward a common reference: the broadband level the channel came in at,
  // rounded to what the receiver accepts.
  final delta = -m.rmsDbfs - 20;
  return (delta.clamp(-12.0, 12.0) / integraLevelStepDb).round() *
      integraLevelStepDb;
}

EqPreset? _eqFor(
  Map<String, Measurement> byChannel,
  Channel channel,
  TargetCurve target,
  RoomGeometry room,
) {
  final m = byChannel[channel.name];
  if (m == null) return null;
  return generateEq(
    measuredBandsDb: m.bandsDb,
    measuredBandCenters: [for (final b in OctaveBands.all) b.nominal],
    target: target,
    // Never equalise above where a one-point measurement stops describing the
    // room. Schroeder, not a round number.
    maxEqHz: math.min(300, room.schroederFrequency),
  );
}
