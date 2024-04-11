import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

SnackBar customSnackBar(
    {required String text,
    required ColorState colorState,
    SnackBarBehavior behavior = SnackBarBehavior.fixed}) {
  return SnackBar(
    duration: const Duration(
      seconds: 2,
    ),
    content: CustomText(
      text: text,
      style: TextStyleManager.textStyle15w500,
    ),
    backgroundColor: ColorsManager.colorState(colorState),
    behavior: behavior,
  );
}