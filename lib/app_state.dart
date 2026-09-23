import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import 'ar/ar_tracking.dart';
import 'audio/audio_capture.dart';
import 'dsp/impulse_response.dart';
import 'dsp/octave_bands.dart';
import 'dsp/spectrum.dart';
import 'model/measurement.dart';
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

  /// Reference levels the map is quoted against — the first point taken.
  List<double>? get referenceBands => _session?.reference?.bandsDb;

  Future<void> attachStore(SessionStore store) async {
    _store = store;
  }

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
