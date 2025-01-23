import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_app/common/res/app_color.dart';

class BuildTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Color? labelColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? cursorColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? fillColor;
  final double? borderRadius;
  final double? cursorHeight;
  final double? hintTextSize;
  final int? maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? label;
  final Function(String? value)? validation;
  final bool? filled;
  final bool? isDense;
  final bool showBorder;
  final bool? readOnly;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController textEditingController;
  final Function? onTap;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged; // Added onChanged parameter

  BuildTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.labelColor,
    this.hintColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.textColor,
    this.borderRadius,
    this.cursorHeight,
    this.maxLines,
    this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.fillColor,
    this.validation,
    this.onTap,
    this.filled,
    this.keyboardType,
    this.label,
    required this.textEditingController,
    this.prefix,
    this.isDense,
    this.hintTextSize,
    this.minLines,
    required this.showBorder,
    this.inputFormatters,
    this.maxLength,
    this.obscureText,
    this.textInputAction,
    this.onChanged,
    this.focusNode, // Added this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
// Added this line
      obscureText: obscureText ?? false,

      style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w300,
          color: AppColor.blackColor,
          fontSize: 14),
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      controller: textEditingController,
      textInputAction: textInputAction,
      validator: (value) => validation!(value),
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      cursorHeight: cursorHeight,
      cursorColor: cursorColor,
      textAlign: TextAlign.start,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
          color: labelColor ?? Colors.black,
          fontWeight: FontWeight.w400,
        ),
        isDense: isDense,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        alignLabelWithHint: true,
        filled: filled,
        fillColor: fillColor,
        labelText: labelText,
        label: label,
        errorStyle: const TextStyle(color: AppColor.redColor),
        labelStyle: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: hintTextSize,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: showBorder
              ? BorderSide(
                  color: focusedBorderColor ?? AppColor.blackColor,
                )
              : const BorderSide(
                  color: Colors.transparent,
                ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: showBorder
              ? BorderSide(
                  color: enabledBorderColor ?? AppColor.blackColor,
                )
              : const BorderSide(
                  color: Colors.transparent,
                ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: BorderSide(
            color: errorBorderColor ?? AppColor.redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: BorderSide(
            color: errorBorderColor ?? AppColor.redColor,
          ),
        ),
      ),
    );
  }
}
