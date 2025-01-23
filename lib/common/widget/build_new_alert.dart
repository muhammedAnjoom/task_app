import 'package:flutter/material.dart';
import 'package:task_app/common/res/app_color.dart';
import 'package:task_app/common/res/app_font.dart';

import '../utils/utils.dart';

class BuildNewAlertDialog extends StatelessWidget {
  final String title;
  final Function(BuildContext context) onYesTap;

  const BuildNewAlertDialog({
    super.key,
    required this.onYesTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.greyColor,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      // contentTextStyle: TE,

      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontFamily: AppFont.satoshiFont,
              fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              pop(context);
            },
            child: const Text(
              "No",
              style: TextStyle(color: AppColor.blackColor),
            )),
        TextButton(
            onPressed: () {
              onYesTap(context);
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: AppColor.redColor),
            ))
      ],
    );
  }
}
