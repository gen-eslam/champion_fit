import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
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
            onPressed: () {
              context.pushNamed(Routes.forgetScreen);
            },
            child: CustomText(
              text: StringManager.forgetPassword,
              style: TextStyleManager.textStyle18w600,
              color: ColorsManager.yellowClr,
            ),
          ),
        ),
        CustomElevatedButton(
          onPressed: () {
            context.pushNamed(Routes.trainerAndManagerLayoutScreen);
          },
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
          onTap: () {
            context.pushNamed(Routes.registerScreen);
          },
        ),
        AppSizedBox.h24,
      ],
    );
  }
}
