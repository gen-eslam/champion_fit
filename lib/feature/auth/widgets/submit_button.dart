
import 'package:flutter/material.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class SubmitButtom extends StatelessWidget {
  final void Function()? onPressed;
  const SubmitButtom({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: StringManager.submit,
        color: ColorsManager.darkgreen,
        style: TextStyleManager.textStyle18w600,
      ),
    );
  }
}
