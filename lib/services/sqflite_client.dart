import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note_model.dart';

class SqfliteClient {
  final databaseName = "note.db";
  static String noteTableName = "note";

  ///Table for todo
  String noteTable = '''
  CREATE TABLE IF NOT EXISTS $noteTableName (
  noteId INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  content TEXT,
  isCompleted INTEGER
  )''';

  /// Database connection
  Future<Database> initDB() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = "${databasePath.path}/$databaseName";
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(noteTable);
    });
  }

  ///CRUD Methods
  // Get Note
  Future<List<NoteModel>> getNote() async {
    final db = await initDB();
    final List<Map<String, Object?>> res = await db.query(noteTableName);
    return res.map((e) => NoteModel.fromMap(e)).toList();
  }

  // Add Note
  Future<void> addNote(NoteModel todo) async {
    final db = await initDB();
    db.insert(noteTableName, todo.toMap());
  }

  // Update Note
  Future<void> updateNote(NoteModel todo) async {
    final db = await initDB();
    db.update(noteTableName, todo.toMap(),
        where: "noteId = ?", whereArgs: [todo.noteId]);
  }

  // Delete Note
  Future<void> deleteNote(int id) async {
    final db = await initDB();
    db.delete(noteTableName, where: "noteId = ?", whereArgs: [id]);
  }
}
