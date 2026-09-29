import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import 'analysis/decay_analysis.dart';
import 'ar/ar_tracking.dart';
import 'audio/audio_capture.dart';
import 'dsp/impulse_response.dart';
import 'dsp/octave_bands.dart';
import 'dsp/spectrum.dart';
import 'model/measurement.dart';
import 'model/mic_calibration.dart';
import 'model/session.dart';
import 'signal/log_sweep.dart';
import 'store/session_store.dart';

/// Live state shared by the screens: the microphone, the tracker, and the
/// session being built.
///
/// One owner for both hardware streams. Two screens each starting their own
/// capture would fight over the audio session, and on iOS the loser gets
/// silence rather than an error.
class AppState extends ChangeNotifier {
  AppState({
    AudioCapture? capture,
    ArTracking? tracking,
    this.fftSize = 8192,
  })  : capture = capture ?? AudioCapture(),
        tracking = tracking ?? ArTracking();

  final AudioCapture capture;
  final ArTracking tracking;
  final int fftSize;

  SessionStore? _store;
  SpectrumAnalyzer? _analyzer;
  FrameAssembler? _assembler;
  StreamSubscription<void>? _audioSub;
  StreamSubscription<ArPose>? _poseSub;

  // --- live readings -------------------------------------------------------

  Spectrum? _spectrum;
  Spectrum? get spectrum => _spectrum;

  CaptureStatus? _captureStatus;
  CaptureStatus? get captureStatus => _captureStatus;

  ArPose? _pose;
  ArPose? get pose => _pose;

  bool _listening = false;
  bool get listening => _listening;

  String? _error;
  String? get error => _error;

  // --- session -------------------------------------------------------------

  Session? _session;
  Session? get session => _session;

  /// Reference levels the map is quoted against — the first point taken,
  /// corrected the same way the live bars are.
  List<double>? get referenceBands {
    final ref = _session?.reference;
    return ref == null ? null : _session!.correctedBands(ref.bandsDb);
  }

  Future<void> attachStore(SessionStore store) async {
    _store = store;
    _calibration = await store.loadCalibration();
    notifyListeners();
  }

  // --- calibration --------------------------------------------------------

  MicCalibration? _calibration;
  double _splOffsetDb = 0;

  /// The calibration in force: the session's, else the app-level one that
  /// new sessions inherit.
  MicCalibration? get calibration => _session?.calibration ?? _calibration;
  double get splOffsetDb => _session?.calibrationOffsetDb ?? _splOffsetDb;

  Future<void> setCalibration(MicCalibration? cal) async {
    _calibration = cal;
    _session?.calibration = cal;
    await _store?.saveCalibration(cal);
    final session = _session;
    if (session != null) await _store?.save(session);
    notifyListeners();
  }

  Future<void> setSplOffset(double db) async {
    _splOffsetDb = db;
    _session?.calibrationOffsetDb = db;
    final session = _session;
    if (session != null) await _store?.save(session);
    notifyListeners();
  }

  /// A throwaway session carrying the current corrections, for screens that
  /// need to correct a curve before any session exists.
  Session get correctionContext =>
      _session ??
      Session(
        id: '-',
        name: '-',
        createdAt: DateTime.now(),
        signal: ExcitationSignal.externalSweep,
        calibrationOffsetDb: _splOffsetDb,
        calibration: _calibration,
      );

  /// Averaging in progress for a "measure here" tap.
  BandAverager? _averager;
  double _averagedRms = 0;
  int _averagedRmsCount = 0;
  bool get measuring => _averager != null;

  // --- lifecycle -----------------------------------------------------------

  Future<void> startListening({double sampleRate = 48000}) async {
    if (_listening) return;
    _error = null;
    try {
      if (!await capture.requestPermission()) {
        _error = 'Bez přístupu k mikrofonu se měřit nedá.';
        notifyListeners();
        return;
      }
      final status = await capture.start(sampleRate: sampleRate);
      _captureStatus = status;
      // Analyse at the rate the hardware actually gave us, not the one we
      // asked for — a 44.1 kHz device would otherwise mislabel every band.
      _analyzer = SpectrumAnalyzer(fftSize: fftSize, sampleRate: status.sampleRate);
      _assembler = FrameAssembler(frameSize: fftSize, hopSize: fftSize ~/ 2);
      _audioSub = capture.pcm.listen(_onSamples, onError: (Object e) {
        _error = 'Mikrofon: $e';
        notifyListeners();
      });
      _listening = true;
    } catch (e) {
      _error = 'Nepodařilo se spustit mikrofon: $e';
    }
    notifyListeners();
  }

  Future<void> stopListening() async {
    await _audioSub?.cancel();
    _audioSub = null;
    await capture.stop();
    _listening = false;
    notifyListeners();
  }

  Future<bool> startTracking() async {
    if (!await tracking.isSupported()) {
      _error = 'Tohle zařízení neumí ARKit world tracking — body se nedají '
          'umísťovat do prostoru.';
      notifyListeners();
      return false;
    }
    await tracking.start();
    _poseSub = tracking.poses.listen((p) {
      _pose = p;
      notifyListeners();
    });
    return true;
  }

  Future<void> stopTracking() async {
    await _poseSub?.cancel();
    _poseSub = null;
    await tracking.stop();
  }

  // --- sweep recording (phase 3) ------------------------------------------

  final List<double> _recording = [];
  bool _recordingSweep = false;
  bool get recordingSweep => _recordingSweep;

  ImpulseResponse? _impulseResponse;
  ImpulseResponse? get impulseResponse => _impulseResponse;

  /// Hard cap on a sweep recording, so a forgotten stop cannot eat the heap.
  /// 60 s at 48 kHz is 23 MB of doubles and far longer than any sweep.
  static const _maxRecordingSamples = 48000 * 60;

  void startSweepRecording() {
    _recording.clear();
    _impulseResponse = null;
    _recordingSweep = true;
    notifyListeners();
  }

  /// Stops recording and deconvolves against [sweep].
  ///
  /// The recording has to be at least as long as the sweep — a deconvolution
  /// of a truncated sweep produces an impulse response that looks plausible
  /// and is wrong, so it is refused instead.
  ImpulseResponse? finishSweepRecording(LogSweep sweep) {
    _recordingSweep = false;
    if (_recording.length < sweep.length) {
      _error = 'Nahrávka je kratší než sweep '
          '(${(_recording.length / sweep.sampleRate).toStringAsFixed(1)} s '
          'z ${(sweep.length / sweep.sampleRate).toStringAsFixed(1)} s). '
          'Spusť nahrávání dřív, než pustíš signál.';
      notifyListeners();
      return null;
    }
    _impulseResponse =
        deconvolveSweep(recording: List<double>.of(_recording), sweep: sweep);
    notifyListeners();
    return _impulseResponse;
  }

  DecayAnalysis? _decay;

  /// Band decay figures of the current response, computed on first use.
  DecayAnalysis? get decayAnalysis {
    final ir = _impulseResponse;
    if (ir == null) return null;
    final d = _decay;
    if (d != null && d.matches(ir)) return d;
    return _decay = DecayAnalysis.of(ir);
  }

  double get recordedSeconds =>
      _recording.length / (_captureStatus?.sampleRate ?? 48000);

  void _onSamples(List<double> samples) {
    if (_recordingSweep && _recording.length < _maxRecordingSamples) {
      // Raw samples, before the assembler: its frames overlap, so appending
      // those would record every sample twice.
      _recording.addAll(samples);
    }

    final assembler = _assembler;
    final analyzer = _analyzer;
    if (assembler == null || analyzer == null) return;

    for (final frame in assembler.add(samples)) {
      final s = analyzer.analyze(frame);
      _spectrum = s;
      final avg = _averager;
      if (avg != null) {
        avg.add(s.bandsDb);
        _averagedRms += math.pow(10, s.rmsDbfs / 10).toDouble();
        _averagedRmsCount++;
      }
      notifyListeners();
    }
  }

  // --- measuring -----------------------------------------------------------

  Future<Session> beginSession({
    required String name,
    required ExcitationSignal signal,
  }) async {
    final s = Session(
      id: DateTime.now().microsecondsSinceEpoch.toRadixString(36),
      name: name,
      createdAt: DateTime.now(),
      signal: signal,
      sampleRate: _captureStatus?.sampleRate ?? 48000,
      calibrationOffsetDb: _splOffsetDb,
      calibration: _calibration,
    );
    _session = s;
    await _store?.save(s);
    notifyListeners();
    return s;
  }

  /// Averages for [duration] and stores the result at the current AR position.
  ///
  /// Refuses while tracking is not normal: a point with a wrong position is
  /// worse than a missing one, because the heatmap will smear it across
  /// everything nearby and there is no way to tell afterwards.
  Future<Measurement?> measureHere({
    Duration duration = const Duration(seconds: 3),
    String? note,
  }) async {
    final session = _session;
    if (session == null || !_listening) return null;

    final p = _pose;
    if (p == null || !p.quality.usableForMeasurement) {
      _error = p?.hint ??
          'Sledování polohy není spolehlivé — bod by seděl jinde, než stojíš.';
      notifyListeners();
      return null;
    }

    _averager = BandAverager(OctaveBands.all.length);
    _averagedRms = 0;
    _averagedRmsCount = 0;
    notifyListeners();

    await Future<void>.delayed(duration);

    final avg = _averager;
    _averager = null;
    if (avg == null || avg.blocks == 0) {
      _error = 'Za ${duration.inSeconds} s nedorazil žádný zvuk.';
      notifyListeners();
      return null;
    }

    final point = Measurement(
      id: 'p${session.points.length + 1}',
      position: _pose?.position ?? p.position,
      timestamp: DateTime.now(),
      bandsDb: avg.meanDb,
      rmsDbfs: _averagedRmsCount == 0
          ? -160
          : 10 * math.log(_averagedRms / _averagedRmsCount) / math.ln10,
      arAccuracy: p.quality.name,
      note: note,
    );
    session.points.add(point);
    await _store?.save(session);
    notifyListeners();
    return point;
  }

  /// Stores the last deconvolved sweep as a measurement for [channel].
  ///
  /// The point's band levels come from the *whole* response, one second of
  /// it: below the Schroeder frequency the EQ has to see the room, not just
  /// the speaker, and that is where the EQ works. The gated bands live in the
  /// summary for the comparisons that want the speaker alone.
  ///
  /// Position is the AR pose when tracking is usable and the origin when it
  /// is not — channel measurements are taken from the seat and the design
  /// report does not need to know where the seat is in AR space, only that
  /// every channel was measured from the same place.
  ///
  /// With [replace] the channel's earlier points of the same kind are
  /// dropped first: a re-measurement after moving a speaker must not be
  /// averaged with the response the speaker no longer has. Without it the
  /// new point is one more sweep to average, which is the way to beat the
  /// noise of a single take.
  Future<Measurement?> addSweepMeasurement({
    required String channel,
    bool afterEq = false,
    bool replace = false,
    Duration gate = const Duration(milliseconds: 5),
  }) async {
    final ir = _impulseResponse;
    if (ir == null) return null;
    final session = _session ??
        await beginSession(
            name: 'Kanály', signal: ExcitationSignal.externalSweep);

    if (replace) {
      final stale = session.points
          .where((p) => p.channel == channel && p.afterEq == afterEq)
          .toList();
      for (final p in stale) {
        session.points.remove(p);
        final file = p.impulse?.file;
        if (file != null) {
          _impulseCache.remove(file);
          await _store?.deleteImpulse(file);
        }
      }
    }

    final room = ir.gated(window: const Duration(seconds: 1));
    final (freqs, levels) = room.frequencyResponse();
    final bands = bandMeansFromTransferDb(levels, binHz: freqs[1]);

    // Ids stay unique after removals: count up from the largest seen, not
    // from the current length.
    var maxId = 0;
    for (final p in session.points) {
      final n = int.tryParse(p.id.replaceFirst('p', ''));
      if (n != null && n > maxId) maxId = n;
    }
    final id = 'p${maxId + 1}';
    String? file;
    final store = _store;
    if (store != null) {
      file = await store.writeImpulse(session.id, id, ir);
    }

    final p = _pose;
    final point = Measurement(
      id: id,
      position: (p != null && p.quality.usableForMeasurement)
          ? p.position
          : Vec3.zero,
      timestamp: DateTime.now(),
      bandsDb: bands,
      rmsDbfs: _broadbandDb(bands),
      arAccuracy: p?.quality.name,
      channel: channel,
      afterEq: afterEq,
      impulse: ImpulseSummary.from(ir,
          gate: gate,
          file: file,
          midBandRt60Seconds: decayAnalysis?.midBandRt60Seconds),
    );
    session.points.add(point);
    await store?.save(session);
    notifyListeners();
    return point;
  }

  /// Energy mean of the bands between 100 Hz and 4 kHz: the level a receiver's
  /// pink-noise calibration would settle on, minus the extremes where a phone
  /// microphone and a room disagree the most.
  static double _broadbandDb(List<double> bands) {
    var sum = 0.0;
    var n = 0;
    for (var i = 0; i < OctaveBands.all.length; i++) {
      final f = OctaveBands.all[i].nominal;
      if (f < 100 || f > 4000) continue;
      sum += math.pow(10, bands[i] / 10).toDouble();
      n++;
    }
    return n == 0 || sum <= 0 ? -160 : 10 * math.log(sum / n) / math.ln10;
  }

  /// Loads the full impulse response behind a point, if it has one on disk.
  Future<ImpulseResponse?> impulseFor(Measurement m) async {
    final file = m.impulse?.file;
    final store = _store;
    if (file == null || store == null) return null;
    return _impulseCache[file] ??= (await store.readImpulse(file)) ??
        ImpulseResponse(samples: Float64List(0), sampleRate: 48000);
  }

  final _impulseCache = <String, ImpulseResponse>{};

  /// Distance from the last stored point — drives the "every 0.5 m" continuous
  /// mode from the plan.
  double? get distanceFromLastPoint {
    final last = _session?.points.isNotEmpty == true ? _session!.points.last : null;
    final here = _pose?.position;
    if (last == null || here == null) return null;
    return last.position.distanceTo(here);
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _audioSub?.cancel();
    _poseSub?.cancel();
    capture.stop();
    tracking.stop();
    super.dispose();
  }
}
