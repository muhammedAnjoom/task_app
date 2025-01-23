import 'package:flutter/material.dart';
import 'package:task_app/common/res/app_font.dart';
import 'package:task_app/common/res/app_images.dart';
import 'package:task_app/common/utils/utils.dart';
import 'package:task_app/models/note_model.dart';
import 'package:task_app/view/home/page/add_note_page.dart';

import '../../../common/res/app_color.dart';
import '../../../common/res/app_icons.dart';
import '../../../common/widget/build_svg_icon_button.dart';

class NoteDetailsPage extends StatelessWidget {
  final NoteModel noteModel;
  const NoteDetailsPage({
    super.key,
    required this.noteModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkModeScaffoldColor,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(5),
                    child: BuildSvgIconButton(
                      assetImagePath: AppIcons.forwardArrowIcon,
                      iconHeight: 20,
                      onTap: () {
                        pop(context);
                      },
                    ),
                  ),
                  const Spacer(),
                  BuildSvgIconButton(
                    assetImagePath: AppIcons.editIcon,
                    iconHeight: 20,
                    onTap: () {
                      push(
                          context,
                          AddNotePage(
                            isEdit: true,
                            noteModel: noteModel,
                          ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.detailsBackgroundImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      noteModel.title,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFont.unboundedFont,
                          color: AppColor.headingTextColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      noteModel.content,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFont.satoshiFont,
                          color: AppColor.subTitleColor),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
