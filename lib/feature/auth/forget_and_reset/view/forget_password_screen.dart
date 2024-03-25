import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';
import 'package:gem_app2/feature/auth/widgets/submit_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            AppSizedBox.h16,
            CustomText(
              text: StringManager.forgetPassword,
              style: TextStyleManager.textStyle30w700,
            ),
            AppSizedBox.h16,
            CustomText(
              text: StringManager.forgetPasswordMessage,
              style: TextStyleManager.textStyle20w400,
            ),
            AppSizedBox.h24,
            const CustomTextFormFeild(
              text: StringManager.emailAdress,
              prefixIcon: Icons.email,
            ),
            AppSizedBox.h24,
            SubmitButtom(onPressed: () {
              context.pushNamed(Routes.otpScreen);
            }),
          ],
        ),
      ),
    );
  }
}
