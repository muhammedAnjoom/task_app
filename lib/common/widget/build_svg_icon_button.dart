import 'package:flutter/material.dart';
import 'package:task_app/common/widget/build_svg_icon.dart';

class BuildSvgIconButton extends StatelessWidget {
  final String assetImagePath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? color;
  final VoidCallback onTap;

  const BuildSvgIconButton({
    super.key,
    required this.assetImagePath,
    this.color,
    required this.onTap,
    this.iconWidth,
    this.iconHeight,
    // this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BuildSvgIcon(
        assetImagePath: assetImagePath,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
        color: color,
      ),
    );
  }
}
