import 'dart:convert';

NoteModel todoFromMap(String str) => NoteModel.fromMap(json.decode(str));

String todoToMap(NoteModel data) => json.encode(data.toMap());

class NoteModel {
  final int? noteId;
  final String title;
  final String content;
  int isCompleted;

  NoteModel({
    this.noteId,
    required this.title,
    required this.content,
    required this.isCompleted,
  });

  NoteModel copyWith({
    int? noteId,
    String? title,
    String? content,
    int? isCompleted,
  }) =>
      NoteModel(
        noteId: noteId ?? this.noteId,
        title: title ?? this.title,
        content: content ?? this.content,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
        noteId: json["noteId"],
        title: json["title"],
        content: json["content"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toMap() => {
        "noteId": noteId,
        "title": title,
        "content": content,
        "isCompleted": isCompleted,
      };
}
