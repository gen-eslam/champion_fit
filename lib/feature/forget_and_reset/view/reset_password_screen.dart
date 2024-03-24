// newPasswordScreen
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: context.deviceHeight * 0.10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSizedBox.h32,
                CustomText(
                  text: StringManager.resetPassword,
                  style: TextStyleManager.textStyle32w700,
                ),
                AppSizedBox.h16,
                CustomText(
                  text: StringManager.resetPasswordMessage,
                  style: TextStyleManager.textStyle20w400,
                ),
                AppSizedBox.h24,
                const CustomTextFormFeild(
                  text: StringManager.newPassword,
                  prefixIcon: Icons.password,
                  isPassword: true,
                ),
                AppSizedBox.h24,
                const CustomTextFormFeild(
                  text: StringManager.confirmNewPassword,
                  prefixIcon: Icons.password,
                  isPassword: true,
                ),
                AppSizedBox.h32,
                CustomElevatedButton(
                    child: CustomText(
                      text: StringManager.saveChanges,
                      style: TextStyleManager.textStyle20w400,
                      color: ColorsManager.darkgreen,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
