import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

import '../dsp/impulse_response.dart';
import '../model/session.dart';

/// Sessions on disk, one JSON file each.
///
/// JSON rather than SQLite: a session is a few hundred points, it is written
/// once and read whole, and the file that lands in the app's folder is exactly
/// the file the plan wants to be shareable. A database would add a schema to
/// migrate and give nothing back at this size.
///
/// The directory is injected so the store is testable without a device.
class SessionStore {
  SessionStore(this.directory);

  final Directory directory;

  static Future<SessionStore> forApp() async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory('${docs.path}/sessions');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return SessionStore(dir);
  }

  File _file(String id) => File('${directory.path}/$id.json');

  Future<void> save(Session session) async {
    if (!directory.existsSync()) directory.createSync(recursive: true);
    // Written via a temporary file and renamed: a session interrupted
    // mid-write is a lost measurement walk, and walks are not cheap to redo.
    final tmp = File('${_file(session.id).path}.tmp');
    await tmp.writeAsString(
      const JsonEncoder.withIndent('  ').convert(session.toJson()),
      flush: true,
    );
    await tmp.rename(_file(session.id).path);
  }

  Future<Session?> load(String id) async {
    final f = _file(id);
    if (!f.existsSync()) return null;
    return Session.fromJson(
        jsonDecode(await f.readAsString()) as Map<String, dynamic>);
  }

  Future<void> delete(String id) async {
    final f = _file(id);
    if (f.existsSync()) await f.delete();
    // The session's impulse sidecars go with it; without the JSON that names
    // them they are unreachable anyway.
    if (!directory.existsSync()) return;
    for (final e in directory.listSync()) {
      if (e is File && e.path.endsWith('.ir') && e.uri.pathSegments.last.startsWith('${id}_')) {
        await e.delete();
      }
    }
  }

  /// Name of the sidecar an impulse response for [pointId] is kept under.
  static String impulseFileName(String sessionId, String pointId) =>
      '${sessionId}_$pointId.ir';

  /// Writes an impulse response next to the session and returns the file
  /// name to put in the point's [ImpulseSummary.file].
  ///
  /// Float32 rather than JSON: two million samples as text is forty
  /// megabytes and a minute to parse; as float32 it is eight and instant.
  /// The precision lost against the float64 in memory is below the noise
  /// floor of any phone microphone.
  Future<String> writeImpulse(
    String sessionId,
    String pointId,
    ImpulseResponse ir,
  ) async {
    if (!directory.existsSync()) directory.createSync(recursive: true);
    final name = impulseFileName(sessionId, pointId);
    final data = ByteData(_irHeaderBytes + ir.samples.length * 4);
    var o = 0;
    for (final c in _irMagic.codeUnits) {
      data.setUint8(o++, c);
    }
    data.setUint32(o, 1, Endian.little);
    o += 4;
    data.setFloat64(o, ir.sampleRate, Endian.little);
    o += 8;
    data.setUint32(o, ir.samples.length, Endian.little);
    o += 4;
    for (var i = 0; i < ir.samples.length; i++) {
      data.setFloat32(o + i * 4, ir.samples[i], Endian.little);
    }
    final tmp = File('${directory.path}/$name.tmp');
    await tmp.writeAsBytes(data.buffer.asUint8List(), flush: true);
    await tmp.rename('${directory.path}/$name');
    return name;
  }

  Future<void> deleteImpulse(String name) async {
    final f = File('${directory.path}/$name');
    if (f.existsSync()) await f.delete();
  }

  /// Reads a sidecar written by [writeImpulse]; null when it is missing or
  /// not one of ours.
  Future<ImpulseResponse?> readImpulse(String name) async {
    final f = File('${directory.path}/$name');
    if (!f.existsSync()) return null;
    final bytes = await f.readAsBytes();
    if (bytes.length < _irHeaderBytes) return null;
    final data = ByteData.sublistView(bytes);
    for (var i = 0; i < _irMagic.length; i++) {
      if (data.getUint8(i) != _irMagic.codeUnitAt(i)) return null;
    }
    var o = _irMagic.length;
    final version = data.getUint32(o, Endian.little);
    o += 4;
    if (version != 1) return null;
    final rate = data.getFloat64(o, Endian.little);
    o += 8;
    final n = data.getUint32(o, Endian.little);
    o += 4;
    if (bytes.length < o + n * 4) return null;
    final samples = Float64List(n);
    for (var i = 0; i < n; i++) {
      samples[i] = data.getFloat32(o + i * 4, Endian.little);
    }
    return ImpulseResponse(samples: samples, sampleRate: rate);
  }

  static const _irMagic = 'ASIR';
  static const _irHeaderBytes = 4 + 4 + 8 + 4;

  /// All sessions, newest first. Unreadable files are skipped rather than
  /// thrown on — one corrupt file must not hide every other session.
  Future<List<Session>> listAll() async {
    if (!directory.existsSync()) return [];
    final out = <Session>[];
    for (final e in directory.listSync()) {
      if (e is! File || !e.path.endsWith('.json')) continue;
      try {
        out.add(Session.fromJson(
            jsonDecode(e.readAsStringSync()) as Map<String, dynamic>));
      } on FormatException {
        continue;
      }
    }
    out.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return out;
  }

  /// Writes an export next to the sessions and returns it, for sharing.
  Future<File> writeExport(String filename, String contents) async {
    final f = File('${_exportDir().path}/$filename');
    await f.writeAsString(contents, flush: true);
    return f;
  }

  /// Same, for generated WAV signals.
  Future<File> writeExportBytes(String filename, List<int> bytes) async {
    final f = File('${_exportDir().path}/$filename');
    await f.writeAsBytes(bytes, flush: true);
    return f;
  }

  Directory _exportDir() {
    final dir = Directory('${directory.path}/exports');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return dir;
  }
}
