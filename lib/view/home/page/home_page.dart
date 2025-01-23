import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/utils/utils.dart';
import 'package:task_app/models/note_model.dart';
import 'package:task_app/view/home/page/add_note_page.dart';
import 'package:task_app/view/home/page/widget/build_card_widget.dart';

import '../../../common/res/app_color.dart';
import '../../../view_models/post_view_models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostViewModels>(builder: (context, notifier, child) {
      notifier.note.sort((a, b) => a.isCompleted == 1 ? 1 : -1);
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            push(context, AddNotePage());
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddTodo()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Todo"),
        ),
        body: !notifier.isLoading
            ? notifier.note.isEmpty
                ? const Center(child: Text("No Notes"))
                : ListView.builder(
                    itemCount: notifier.note.length,
                    // reverse: true,
                    itemBuilder: (context, index) {
                      NoteModel note = notifier.note[index];
                      return BuildCardWidget(note: note);
                    })
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
