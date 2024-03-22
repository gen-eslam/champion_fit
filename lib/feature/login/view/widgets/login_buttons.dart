
import 'package:flutter/material.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_outline_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () {},
            child: CustomText(
              text: StringManager.forgetPassword,
              style: TextStyleManager.textStyle18w600,
              color: ColorsManager.yellowClr,
            ),
          ),
        ),
        CustomElevatedButton(
          onPressed: () {},
          child: CustomText(
            text: StringManager.loginMyAccount,
            style: TextStyleManager.textStyle18w600,
            color: ColorsManager.darkgreen,
          ),
        ),
        AppSizedBox.h24,
        CustomText(
          text: StringManager.or,
          style: TextStyleManager.textStyle24w500,
          color: ColorsManager.white,
        ),
        AppSizedBox.h24,
        CustomOutlineButton(
          text: StringManager.signUp,
          onTap: () {},
        ),
        const Spacer(),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () {},
            child: CustomText(
              text: StringManager.contactUs,
              textDecoration: TextDecoration.underline,
              style: TextStyleManager.textStyle18w600,
              color: ColorsManager.white,
            ),
          ),
        ),
      ],
    );
  }
}
