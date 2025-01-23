import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/res/app_font.dart';
import 'package:task_app/common/res/app_icons.dart';
import 'package:task_app/common/res/app_images.dart';
import 'package:task_app/common/utils/app_toast.dart';
import 'package:task_app/common/utils/utils.dart';
import 'package:task_app/common/widget/build_new_alert.dart';
import 'package:task_app/common/widget/build_svg_icon.dart';
import 'package:task_app/common/widget/build_svg_icon_button.dart';
import 'package:task_app/view/home/page/note_details_page.dart';

import '../../../../common/res/app_color.dart';
import '../../../../models/note_model.dart';
import '../../../../view_models/note_view_models.dart';

class BuildCardWidget extends StatelessWidget {
  const BuildCardWidget({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<NoteViewModels>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: note.isCompleted == 0 ? false : true,
            // checkColor: AppColor.primaryColor,
            activeColor: AppColor.primaryColor,
            onChanged: (value) {
              note.isCompleted = value! ? 1 : 0;
              notifier.updateNote(note);
            },
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                push(
                  context,
                  NoteDetailsPage(noteModel: note),
                );
              },
              child: Container(
                // width: screenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(AppImages.cardBackgroundImage),
                        fit: BoxFit.cover),
                    border: note.isCompleted == 1
                        ? Border.all(
                            color: AppColor.primaryColor.withOpacity(0.26),
                            width: 1,
                          )
                        : null,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BuildSvgIconButton(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return BuildNewAlertDialog(
                                  onYesTap: (context) async {
                                    notifier.deleteNote(note.noteId!);
                                    AppToasts.showSuccessToastTop(
                                        context, "Note Deleted");
                                    pop(context);
                                  },
                                  title:
                                      "Are you sure you want to\ndelete the note?",
                                );
                              });
                        },
                        assetImagePath: AppIcons.deleteIcon,
                        iconHeight: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.title,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: AppFont.unboundedFont,
                                decorationColor: AppColor.primaryColor,
                                decorationThickness: 2,
                                decoration: note.isCompleted == 0
                                    ? null
                                    : TextDecoration.lineThrough,
                                color: AppColor.headingTextColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            note.content,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: AppFont.satoshiFont,
                                decorationColor: AppColor.primaryColor,
                                decorationThickness: 2,
                                decoration: note.isCompleted == 0
                                    ? null
                                    : TextDecoration.lineThrough,
                                color: AppColor.subTitleColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: BuildSvgIcon(
                        assetImagePath: AppIcons.aroundArrowIcon,
                        iconHeight: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
