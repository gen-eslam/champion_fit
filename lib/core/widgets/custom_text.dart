import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';

class CustomText extends StatelessWidget {
  final TextStyle style;
  final Color? color;
  final String text;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final int? maxLines;
  const CustomText(
      {super.key,
      required this.text,
      this.color = ColorsManager.white,
      required this.style,
      this.textDecoration,
      this.textOverflow,
      this.maxLines,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          color: context.isDarkMode ? Colors.white : Colors.black,
          overflow: textOverflow,
          decoration: textDecoration),
      child: Text(
        text,
        style: style.copyWith(
          color: color,
        ),
      ),
    );
  }
}
