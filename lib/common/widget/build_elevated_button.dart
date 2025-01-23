import 'package:flutter/material.dart';
import 'package:task_app/common/res/app_color.dart';
import 'package:task_app/common/res/app_font.dart';

import '../utils/utils.dart';

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton({
    super.key,
    required this.buttonText,
    this.height,
    required this.onTap,
  });
  final String buttonText;
  final double? height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: screenWidth(context),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColor.buttonSecondGradient,
              AppColor.buttonFirstGradient,
            ],
          ),
          borderRadius: BorderRadius.circular(53),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: AppFont.unboundedFont,
                color: AppColor.headingTextColor),
          ),
        ),
      ),
    );
  }
}
