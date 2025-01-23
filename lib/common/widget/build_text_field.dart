import 'package:flutter/material.dart';
import 'package:task_app/common/res/app_color.dart';

class BuildTextFormWidget extends StatelessWidget {
  const BuildTextFormWidget({
    super.key,
    this.hintText,
    this.maxLines,
    required this.controller,
    this.validation,
    this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.maxLength,
    this.minLines,
  });
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextEditingController controller;
  final Function(String? value)? validation;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primaryColor.withOpacity(0.26),
      keyboardType: keyboardType,
      focusNode: focusNode,
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
      minLines: minLines,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validation!(value),
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: AppColor.headingTextColor),
      decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primaryColor.withOpacity(0.26),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primaryColor.withOpacity(0.26),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primaryColor.withOpacity(0.26),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.redColor.withOpacity(0.80),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.hintTextColor,
              )),
    );
  }
}
