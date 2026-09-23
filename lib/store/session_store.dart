import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

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
  }

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
