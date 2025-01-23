import 'package:flutter/material.dart';

import '../models/note_model.dart';
import '../repositories/repositories.dart';

class NoteViewModels extends ChangeNotifier {
  final _service = Repositories();
  bool _isLoading = false;
  List<NoteModel> _note = [];
  List<NoteModel> get note => _note;
  bool get isLoading => _isLoading;

  Future<void> fetchNote() async {
    _isLoading = true;
    await _service.initDB();
    _note = await _service.getNote();
    _isLoading = false;
    notifyListeners();
  }

  // Note Insert

  Future<void> insertNote(NoteModel note) async {
    await _service.initDB();
    _service.addNote(note);
    await fetchNote();
  }

  // Note Update
  Future<void> updateNote(NoteModel note) async {
    await _service.initDB();
    _service.updateNote(note);
    await fetchNote();
  }

  // Note Delete
  Future<void> deleteNote(int id) async {
    await _service.initDB();
    _service.deleteNote(id);
    await fetchNote();
  }

  //Init
  /// Init method, to initialize Note list on the start
  init() {
    fetchNote();
    notifyListeners();
  }
}
