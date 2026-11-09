// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tabScan => 'Scan';

  @override
  String get tabMap => 'Map';

  @override
  String get tabResponse => 'Response';

  @override
  String get tabDesign => 'Design';

  @override
  String get tabSignals => 'Signals';

  @override
  String get rtaSnapshotFailed => 'Snapshot was not saved.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Saved as point $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Saved as point $id (no position).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      one: '1 point',
    );
    return 'Calibration $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Cannot read the file: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL offset';

  @override
  String get rtaOffsetHelp =>
      'Play a 1 kHz tone, read the level on an SPL meter and enter the difference from what the analyzer shows. With a non-zero offset, levels are marked as an SPL estimate; without it they stay in dBFS.';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonStop => 'Stop';

  @override
  String get commonStartMic => 'Start microphone';

  @override
  String get tabAnalyzer => 'Analyzer';

  @override
  String get rtaUnfreeze => 'Unfreeze';

  @override
  String get rtaFreeze => 'Freeze';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Max / min traces';

  @override
  String get rtaResetTraces => 'Reset traces';

  @override
  String get rtaSaveAsPoint => 'Save as point (3 s)';

  @override
  String get rtaMicCalibration => 'Microphone calibration…';

  @override
  String get rtaRemoveCalibration => 'Remove calibration';

  @override
  String get rtaOffsetMenu => 'dB SPL offset…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · no signal processing';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      one: '1 point',
    );
    return 'Calibration $name: $_temp0, correction $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimate)';

  @override
  String get rtaFrozenHint =>
      'Frozen — the microphone keeps running, it just isn\'t drawn.';

  @override
  String get rtaRelativeHint =>
      'Levels are relative (dBFS). The outline appears once you save the first point — it is the reference for the rest.';

  @override
  String get rtaReferenceHint =>
      'Solid bars = here. Outline = reference point.';

  @override
  String get rtaEnvelopeHint => 'Red = max, green = min since reset.';

  @override
  String get rtaMicStopped => 'microphone stopped';

  @override
  String get rtaSilence => 'silence — is a signal playing?';

  @override
  String get rtaPlaceholder =>
      'Start the microphone and play a signal into the room.';

  @override
  String rtaBandsInfo(int count) {
    return '$count third-octave bands, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Room scan';

  @override
  String scanPointCount(int count) {
    return '$count pts';
  }

  @override
  String get commonMicNotRunning => 'Microphone is not running';

  @override
  String get scanMicNeeded =>
      'Without it only the position is measured, not the sound.';

  @override
  String get scanContinuous => 'Continuous measurement';

  @override
  String get scanContinuousHint =>
      'A point automatically every 0.5 m of walking';

  @override
  String get scanMeasuring => 'Measuring…';

  @override
  String get scanMeasureHere => 'Measure here';

  @override
  String scanPointSaved(String id, String position) {
    return 'Point $id saved at $position';
  }

  @override
  String get scanStartTracking => 'Start position tracking';

  @override
  String get scanStartTrackingHint =>
      'ARKit — this is how the app knows where you stand in the room.';

  @override
  String scanPosition(String position) {
    return 'Position: $position m from the origin';
  }

  @override
  String get scanSetOriginHint =>
      'Stand at the listening seat and set the origin.';

  @override
  String get scanOriginHere => 'Origin is here';

  @override
  String get scanNoPoints => 'No points yet.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'spread 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Living room';

  @override
  String get scanNewMeasurement => 'New measurement';

  @override
  String get scanRoomName => 'Room name';

  @override
  String get scanExcitation => 'What will excite the room';

  @override
  String get scanPhoneNoiseHint =>
      'Rough guide only — the phone speaker produces no bass at all.';

  @override
  String get scanStart => 'Start';

  @override
  String get mapExportTooltip => 'Export FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'The map needs at least two points. Walk the room and keep measuring.';

  @override
  String get mapShareText =>
      'FRD per point (import into REW / VituixCAD) and the whole session as JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Flattest spot: $id at $position m (spread $variation dB in 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'The only signal that yields the impulse response, reverberation time and first reflections. Play it from a computer or DAC into the speakers and let the phone record.';

  @override
  String get signalsLength => 'Length';

  @override
  String get signalsFrom => 'From';

  @override
  String get signalsTo => 'To';

  @override
  String get signalsMonoNoChannel => 'Mono (no channel)';

  @override
  String get signalsExportWav => 'Export WAV';

  @override
  String get signalsPinkNoise => 'Pink noise';

  @override
  String get signalsPinkHelp =>
      'Equal energy in every octave. Gives only the frequency response, no time or reflections — enough for a quick “is something going on here?”.';

  @override
  String get signalsExportPink => 'Export 30 s WAV';

  @override
  String get signalsHowTo => 'How to measure';

  @override
  String get signalsStep1 =>
      'Play the signal from a computer into the speakers, not from the phone.';

  @override
  String get signalsStep2 =>
      'Set the volume so the analyzer shows about −20 dBFS. Clipping looks like a reflection.';

  @override
  String get signalsStep3 =>
      'Hold the phone upright at arm\'s length, microphone towards the speakers.';

  @override
  String get signalsStep4 =>
      'Disconnect Bluetooth headphones — compression and latency ruin the measurement.';

  @override
  String get signalsNoteMono =>
      'Mono into both speakers at once sums L and R, and their difference vanishes in the sum. To measure channels, pick a channel.';

  @override
  String get signalsNoteStereo =>
      'Stereo file with the signal in one channel only — anything that plays stereo will play it.';

  @override
  String get signalsNoteChannel =>
      'Mono file named after the channel. Route it to the right receiver input from a DAW or through a multichannel input; a laptop with stereo output won\'t get it onto this channel.';

  @override
  String get channelsTitle => 'Channel measurement';

  @override
  String get channelsHelp =>
      'Stand at the listening seat. For each channel: start recording, play a sweep into it from the Signals tab, tap Done. Without these points the design has nothing to build EQ and levels from.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Verify after entering EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'The point is saved as “after EQ” and doesn\'t overwrite the one the EQ was computed from.';

  @override
  String channelsRecording(String seconds) {
    return 'Recording $seconds s — play the sweep now';
  }

  @override
  String get channelsNotMeasured => 'not measured';

  @override
  String get channelsMeasuredNoise => 'measured with noise';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · direct sound after $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · direct sound after $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Done';

  @override
  String get channelsMeasure => 'Measure';

  @override
  String get channelsAdd => 'Add';

  @override
  String get channelsAgain => 'Redo';

  @override
  String get compareTitle => 'Comparison';

  @override
  String get compareNeedsTwoPoints => 'Comparison needs at least two points.';

  @override
  String get commonWithRoom => 'with room';

  @override
  String get commonDirectSound => 'direct sound';

  @override
  String get compareAfterEq => 'after EQ';

  @override
  String get compareBandsA => 'A (bands)';

  @override
  String get compareBandsB => 'B (bands)';

  @override
  String get compareArrivalDiff => 'Arrival difference A − B';

  @override
  String get compareBroadbandDiff => 'Broadband level A − B';

  @override
  String get compareWorstBelow300 => 'Largest difference below 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB in the $band Hz band';
  }

  @override
  String get compareTrimNote =>
      'Distance and level trim even out the arrival and level difference. They won\'t even out the shape difference below 300 Hz — that comes from a different wall at a different distance and is fixed by moving things.';

  @override
  String get designRt60Live => 'T20 125–500 Hz from the latest response';

  @override
  String get designRt60Stored => 'T20 125–500 Hz from a saved sweep';

  @override
  String get designRt60Guess =>
      'estimate — measure a sweep, Schroeder is only a guess for now';

  @override
  String get designExportTooltip => 'Export configuration';

  @override
  String get designCompute => 'Compute design';

  @override
  String get designLidarChecking => 'Checking for LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR available';

  @override
  String get designLidarMissing => 'No LiDAR — enter the dimensions by hand';

  @override
  String get designLidarHint =>
      'The scan gets walls to the centimetre, so reflection points and boundary distances are right too, not just the modes.';

  @override
  String get designManualHint =>
      'The modal calculation needs only three numbers — but you lose reflection points and exact distances to the walls.';

  @override
  String get designStopScan => 'Stop scan';

  @override
  String get designScanRoom => 'Scan the room';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls walls',
      one: '1 wall',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings openings',
      one: '1 opening',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Room dimensions';

  @override
  String get designLength => 'Length';

  @override
  String get designWidth => 'Width';

  @override
  String get designHeight => 'Height';

  @override
  String get designWhatToDo => 'What to do about it';

  @override
  String get designRoomModes => 'Room modes';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Above $schroeder Hz (Schroeder) individual modes no longer make sense. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: measured, target, prediction';

  @override
  String get designEqHelp =>
      'The prediction is the measured response plus a model of the receiver\'s fifteen bands. After entering the EQ, measure the channel again with the “after EQ” switch to see how close the model was.';

  @override
  String get designReceiverConfig => 'Receiver configuration';

  @override
  String get designGeometryOnly =>
      'Without sweep measurements of the channels there is only geometry here: distances and crossover frequencies. EQ and levels arrive once there are points per channel.';

  @override
  String get designShareSubject => 'Configuration design';

  @override
  String get impulseTitle => 'Impulse response';

  @override
  String get impulseCompareTooltip => 'Compare points';

  @override
  String get impulseExportTooltip => 'Export FRD with phase';

  @override
  String get impulseTapToStart => 'Tap to start.';

  @override
  String get impulseSweepTitle => 'The sweep you play into the speakers';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. It must match what you play — otherwise the deconvolution returns nonsense.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Recording — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Now play the sweep from the computer.';

  @override
  String get impulseStartRecording => 'Start recording, then play the sweep';

  @override
  String get impulseFrequencyResponse => 'Frequency response';

  @override
  String get impulseWithRoom => 'with room (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'direct sound (window $ms ms)';
  }

  @override
  String get impulseWindow => 'Window';

  @override
  String impulseWindowHelp(String hz) {
    return 'A longer window sees lower (now valid above $hz Hz) but lets in the first reflection. Below the limit the curve is neither smoothed nor commented: that\'s the window, not the room.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Up to first reflection ($ms ms)';
  }

  @override
  String get impulseTime => 'Time';

  @override
  String get impulseImpulse => 'impulse';

  @override
  String get impulseTimeHelp =>
      'Blue is the window, the orange line the first reflection found. Time zero is the direct sound.';

  @override
  String get impulseSpectrogram => 'Spectrogram';

  @override
  String get commonHide => 'Hide';

  @override
  String get commonShow => 'Show';

  @override
  String get impulseSpectrogramHelp =>
      'Time in ms from the direct sound, frequency upwards, colour is level down to −60 dB. A horizontal stripe that outlasts the rest is a mode; the table above says the same in numbers.';

  @override
  String get impulseDecayByOctave => 'Decay by octave';

  @override
  String get impulseMidNoT20 =>
      'The mid bands did not decay far enough for T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Mid 125–500 Hz: T20 $seconds s — this is the RT60 the design uses.';
  }

  @override
  String get impulseDecayHelp =>
      'In the bass, RT60 from a phone is more of an estimate: background noise is closest there and “—” means the decay didn\'t drop below it. C50 above zero: the direct sound with early reflections carries more energy than the reverberation.';

  @override
  String get impulseResult => 'Result';

  @override
  String get impulseDirectArrived => 'Direct sound arrived after';

  @override
  String get impulseDirectArrivedHelp =>
      'Playback delay plus time of flight — meaningless on its own, but the difference between the L and R speaker matters.';

  @override
  String get impulseFirstReflection => 'First reflection';

  @override
  String get impulseNotFound => 'not found';

  @override
  String impulseAfterDirect(String time) {
    return '$time after the direct sound';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Either there is none, or it is hidden in the ringing of the direct impulse.';

  @override
  String impulseExtraPath(String metres) {
    return 'Extra path ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'not measurable';

  @override
  String get impulseRt60NoiseHelp =>
      'The decay did not drop far enough above the noise floor — play louder, or at a quieter moment.';

  @override
  String get impulseRt60Help =>
      'The difference between T20 and T30 hints at how clean the decay is.';

  @override
  String get impulseGating => 'Window (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'valid above $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Below this the window doesn\'t see a single period — the curve there is an artefact of the window, not the room.';

  @override
  String get impulseSchroeder => 'Schroeder decay curve';

  @override
  String impulseHdAt(int order) {
    return 'HD$order at 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmonics sit in the negative time of the Farina deconvolution; here they are read from it instead of being discarded. −40 dB is 1 %.';

  @override
  String get impulseHd3Help =>
      'The third harmonic grows faster with overdrive than the second.';

  @override
  String get impulseDistortionHot => 'Distortion above −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Either the sweep is too loud or the speaker is at its limit. A distortion tail looks like a reflection in the impulse — turn it down and measure again before you trust anything.';

  @override
  String get eqMeasured => 'measured';

  @override
  String get eqTarget => 'target';

  @override
  String get eqPredicted => 'predicted after EQ';

  @override
  String get eqMeasuredAfter => 'measured after EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Deviation from target 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'After entering into the receiver';

  @override
  String get eqPredictionVsReality => 'Prediction vs. reality';

  @override
  String eqStubborn(String bands) {
    return 'Stays more than 6 dB from the target: $bands. That\'s interference, not a lack of power — fix it by moving the speaker or the listener, not with more boost.';
  }

  @override
  String get eqModelOk =>
      'The receiver\'s filter behaves roughly like the model.';

  @override
  String get eqModelOff =>
      'The receiver\'s real filter differs from the model more than expected — its bands are probably wider or narrower than assumed here.';

  @override
  String get eqTargetCurve => 'Target curve';

  @override
  String get eqFlat => 'flat';

  @override
  String get eqTargetHelp =>
      'Not flat: above a few kHz the ear hears the direct sound while the microphone sums the reflections too, and a flattened measured curve sounds dull. A gentle tilt at the top and a little bass at the bottom is what people choose in blind listening.';

  @override
  String get eqBassLift => 'Bass lift';

  @override
  String get eqBassBelow => 'Bass below';

  @override
  String get eqTilt => 'Tilt';

  @override
  String get eqDbPerOctave => 'dB/oct';

  @override
  String get eqTiltFrom => 'Tilt from';

  @override
  String get errorMicPermission =>
      'Measuring is impossible without microphone access. Allow it in Settings → AudioScanner → Microphone.';

  @override
  String errorMic(String error) {
    return 'Microphone: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Could not start the microphone: $error';
  }

  @override
  String get errorNoArkit =>
      'This device can\'t do ARKit world tracking — points can\'t be placed in space.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'The recording is shorter than the sweep ($recorded s of $expected s). Start recording before you play the signal.';
  }

  @override
  String get sessionSnapshots => 'Snapshots';

  @override
  String get errorTrackingUnreliable =>
      'Position tracking is unreliable — the point would land somewhere other than where you stand.';

  @override
  String errorNoSound(int seconds) {
    return 'No sound arrived within $seconds s.';
  }

  @override
  String get noteSnapshotNoPose => 'analyzer snapshot, no position';

  @override
  String get sessionChannels => 'Channels';

  @override
  String get trackingOk => 'Tracking OK';

  @override
  String get trackingLimited => 'Weak tracking';

  @override
  String get trackingUnavailable => 'No tracking';

  @override
  String get poseHintFeatures =>
      'Too little detail in view — point the phone at something textured, not a bare wall.';

  @override
  String get poseHintMotion => 'Moving too fast — walk slower.';

  @override
  String get poseHintLight =>
      'Too little light — turn the lights on, the camera can\'t see where it is.';

  @override
  String get poseHintInitializing =>
      'ARKit is starting up, move around a little.';

  @override
  String get poseHintRelocalizing =>
      'Looking for the original point again — go back to where you started.';

  @override
  String get signalPhonePink => 'Pink noise from the phone';

  @override
  String get signalExternalPink => 'Pink noise from the speakers';

  @override
  String get signalExternalSweep => 'Sweep from the speakers';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth microphone: compression and latency ruin the measurement. Disconnect the headphones and use the built-in microphone.';

  @override
  String get captureWarningProcessing =>
      'The system didn\'t turn off signal processing (AGC / noise suppression). Measured differences between spots will be distorted.';

  @override
  String get captureWarningMeasurementMode =>
      'Could not enable measurement mode — the microphone applies its own frequency response correction.';

  @override
  String get captureRouteUnknown => 'unknown';

  @override
  String get axisLength => 'length';

  @override
  String get axisWidth => 'width';

  @override
  String get axisHeight => 'height';
}
