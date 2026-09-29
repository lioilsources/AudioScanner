import 'dart:convert';

import 'package:audio_scanner/dsp/octave_bands.dart';
import 'package:audio_scanner/export/frd.dart';
import 'package:audio_scanner/model/measurement.dart';
import 'package:audio_scanner/model/mic_calibration.dart';
import 'package:audio_scanner/model/session.dart';
import 'package:flutter_test/flutter_test.dart';

const umik = '''"Sens Factor =-1.011dB, SERNO: 7001234"
10.0	-2.9
20	-1.2
1000	0.0
2000	0.5
20000	3.1
''';

const rew = '''* Exported by REW
* Freq(Hz) SPL(dB) Phase(deg)
20.000 -1.500 0.0
1000.000 0.000 0.0
16000.000, 2.000, 0.0
''';

void main() {
  group('calibration file parser', () {
    test('reads a UMIK file, header and all', () {
      final cal = MicCalibration.parse(umik, name: 'umik');
      expect(cal.points, hasLength(5));
      expect(cal.points.first, (10.0, -2.9));
      expect(cal.points.last, (20000.0, 3.1));
    });

    test('reads a REW export with comments, commas and a phase column', () {
      final cal = MicCalibration.parse(rew);
      expect(cal.points, hasLength(3));
      expect(cal.responseAt(16000), 2.0);
    });

    test('refuses a file without number rows rather than returning nothing', () {
      expect(() => MicCalibration.parse('hello\nworld\n'), throwsFormatException);
      expect(() => MicCalibration.parse('100 1\n'), throwsFormatException);
    });

    test('interpolates on a log axis and holds the ends', () {
      final cal = MicCalibration.parse(umik);
      // Geometric midpoint of 1000 and 2000 is 1414 Hz → halfway in dB.
      expect(cal.responseAt(1414.2), closeTo(0.25, 0.005));
      expect(cal.responseAt(1), -2.9);
      expect(cal.responseAt(40000), 3.1);
      expect(cal.correctionAt(20000), -3.1);
    });

    test('round-trips through JSON', () {
      final cal = MicCalibration.parse(umik, name: 'umik');
      final back = MicCalibration.fromJson(
          jsonDecode(jsonEncode(cal.toJson())) as Map<String, dynamic>);
      expect(back.name, 'umik');
      expect(back.points, cal.points);
    });
  });

  group('session corrections', () {
    Measurement point() => Measurement(
          id: 'p1',
          position: Vec3.zero,
          timestamp: DateTime.utc(2026),
          bandsDb: List<double>.filled(OctaveBands.all.length, -40),
          rmsDbfs: -30,
        );

    test('correct the display, never the stored point', () {
      final s = Session(
        id: 's',
        name: 's',
        createdAt: DateTime.utc(2026),
        signal: ExcitationSignal.externalSweep,
        calibration: MicCalibration.parse(umik),
        calibrationOffsetDb: 94,
        points: [point()],
      );
      final corrected = s.correctedBands(s.points.single.bandsDb);
      final i20k = OctaveBands.all.indexWhere((b) => b.nominal == 20000);
      final i1k = OctaveBands.all.indexWhere((b) => b.nominal == 1000);
      expect(corrected[i1k], closeTo(-40 + 94, 1e-9));
      expect(corrected[i20k], closeTo(-40 + 94 - 3.1, 1e-9));
      expect(s.points.single.bandsDb.every((v) => v == -40), isTrue);
      expect(s.corrected(s.points.single).rmsDbfs, 64);
      expect(s.hasSplOffset, isTrue);
    });

    test('without any correction the curve comes back untouched', () {
      final s = Session(
        id: 's',
        name: 's',
        createdAt: DateTime.utc(2026),
        signal: ExcitationSignal.externalSweep,
      );
      final levels = [1.0, 2.0, 3.0];
      expect(identical(s.correctedCurve([100, 200, 300], levels), levels), isTrue);
      expect(s.correctionNote, isNull);
    });

    test('the FRD header says what was applied and the numbers follow', () {
      final s = Session(
        id: 's',
        name: 's',
        createdAt: DateTime.utc(2026),
        signal: ExcitationSignal.externalSweep,
        calibration: MicCalibration.parse(umik, name: 'umik.txt'),
        points: [point()],
      );
      final text = FrdExport.fromMeasurement(s.points.single, session: s);
      expect(text, contains('umik.txt'));
      expect(text, contains('subtracted'));
      expect(text, contains('20000.00  -43.100'));
      expect(text, contains('1000.00  -40.000'));

      final plain = FrdExport.fromMeasurement(point());
      expect(plain, contains('RELATIVE'));
      expect(plain, contains('20000.00  -40.000'));
    });

    test('calibration survives the session JSON', () {
      final s = Session(
        id: 's',
        name: 's',
        createdAt: DateTime.utc(2026),
        signal: ExcitationSignal.externalSweep,
        calibration: MicCalibration.parse(umik, name: 'umik'),
      );
      final back = Session.fromJson(
          jsonDecode(jsonEncode(s.toJson())) as Map<String, dynamic>);
      expect(back.calibration?.name, 'umik');
      expect(back.calibration?.points, hasLength(5));
    });
  });
}
