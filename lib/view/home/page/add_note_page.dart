import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/utils/utils.dart';
import 'package:task_app/common/widget/build_text_field.dart';
import 'package:task_app/models/note_model.dart';
import 'package:task_app/view_models/post_view_models.dart';

class AddNotePage extends StatelessWidget {
  final bool? isEdit;
  final NoteModel? noteModel;

  AddNotePage({super.key, this.isEdit = false, this.noteModel});
  final _formKey = GlobalKey<FormState>();
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

// add note in sqflite
  addNote(notifier, context) {
    notifier
        .insertNote(NoteModel(
            title: titleTextController.text,
            content: descriptionTextController.text,
            isCompleted: 0))
        .whenComplete(() => pop(context));
  }

// update note in sqflite
  updateNote(notifier, context) {
    notifier
        .updateNote(NoteModel(
            noteId: noteModel?.noteId,
            title: titleTextController.text,
            content: descriptionTextController.text,
            isCompleted: noteModel!.isCompleted))
        .whenComplete(() => pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<PostViewModels>(context, listen: false);
    if (isEdit!) {
      titleTextController.text = noteModel!.title;
      descriptionTextController.text = noteModel!.content;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (!isEdit!) {
                    addNote(notifier, context);
                  } else {
                    updateNote(notifier, context);
                  }
                }
              },
              child: Text(!isEdit! ? "Save" : "Update")),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                BuildTextField(
                    textEditingController: titleTextController,
                    showBorder: true,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    borderRadius: 5,
                    hintText: "title",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "must enter title";
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                BuildTextField(
                    textEditingController: descriptionTextController,
                    showBorder: true,
                    borderRadius: 5,
                    hintText: "description",
                    minLines: 3,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "must enter description";
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
