import 'package:sqflite/sqlite_api.dart';

import '../models/note_model.dart';
import '../services/sqflite_client.dart';

class Repositories {
  final sqflite = SqfliteClient();
  Future<Database> initDB() => sqflite.initDB();
  Future<List<NoteModel>> getNote() => sqflite.getNote();

  Future<void> addNote(NoteModel todo) => sqflite.addNote(todo);
  Future<void> updateNote(NoteModel todo) => sqflite.updateNote(todo);
  Future<void> deleteNote(int id) => sqflite.deleteNote(id);
}
