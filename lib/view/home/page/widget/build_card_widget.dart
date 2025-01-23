import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/res/app_color.dart';
import '../../../../common/utils/utils.dart';
import '../../../../models/note_model.dart';
import '../../../../view_models/post_view_models.dart';
import '../add_note_page.dart';

class BuildCardWidget extends StatelessWidget {
  const BuildCardWidget({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<PostViewModels>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 4,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            note.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration:
                  note.isCompleted == 0 ? null : TextDecoration.lineThrough,
            ),
          ),
          subtitle: Text(
            note.content,
            style: TextStyle(
                fontSize: 14,
                decoration:
                    note.isCompleted == 0 ? null : TextDecoration.lineThrough,
                color: AppColor.lightBlackColor),
          ),
          //Delete
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: note.isCompleted == 0 ? false : true,
                onChanged: (value) {
                  note.isCompleted = value! ? 1 : 0;
                  notifier.updateNote(note);
                },
              ),
            ],
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    push(
                        context,
                        AddNotePage(
                          isEdit: true,
                          noteModel: note,
                        ));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: AppColor.blackColor,
                  ),
                ),
                IconButton(
                  onPressed: () => notifier.deleteNote(note.noteId!),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
