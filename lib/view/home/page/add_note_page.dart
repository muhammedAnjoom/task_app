import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/res/app_color.dart';
import 'package:task_app/common/res/app_font.dart';
import 'package:task_app/common/utils/app_toast.dart';
import 'package:task_app/common/utils/utils.dart';
import 'package:task_app/view/home/page/home_page.dart';
import 'package:task_app/view/home/page/note_details_page.dart';

import '../../../common/res/app_icons.dart';
import '../../../common/widget/build_elevated_button.dart';
import '../../../common/widget/build_svg_icon_button.dart';
import '../../../common/widget/build_text_field.dart';
import '../../../models/note_model.dart';
import '../../../view_models/note_view_models.dart';

// import '../../widgets/build_text_form_widget.dart';

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
    AppToasts.showSuccessToastTop(context, "Note Added");
  }

// update note in sqflite
  updateNote(notifier, context) {
    final note = NoteModel(
        noteId: noteModel?.noteId,
        title: titleTextController.text,
        content: descriptionTextController.text,
        isCompleted: noteModel!.isCompleted);
    notifier
        .updateNote(note)
        .whenComplete(() => pushAndRemoveUntil(context, HomePage(), false));
    AppToasts.showSuccessToastTop(context, "Note Updated");
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<NoteViewModels>(context, listen: false);
    if (isEdit!) {
      titleTextController.text = noteModel!.title;
      descriptionTextController.text = noteModel!.content;
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.darkModeScaffoldColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  BuildSvgIconButton(
                    assetImagePath: AppIcons.forwardArrowIcon,
                    iconHeight: 20,
                    onTap: () {
                      pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Enter your title &\nDescription",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.headingTextColor,
                        fontFamily: AppFont.unboundedFont),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Title",
                    style: TextStyle(
                        color: AppColor.smallTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontFamily: AppFont.unboundedFont),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BuildTextFormWidget(
                    controller: titleTextController,
                    hintText: "Title",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your Title";
                      } else {
                        return null;
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                        color: AppColor.smallTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontFamily: AppFont.unboundedFont),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BuildTextFormWidget(
                    controller: descriptionTextController,
                    hintText: "Description",
                    minLines: 3,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Please Description";
                      }
                    },
                    textInputAction: TextInputAction.newline,
                    // textInputAction: TextInputAction.,
                  ),
                  const Spacer(),
                  BuildElevatedButton(
                    buttonText: !isEdit! ? "Save" : "Update",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (!isEdit!) {
                          addNote(notifier, context);
                        } else {
                          updateNote(notifier, context);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
