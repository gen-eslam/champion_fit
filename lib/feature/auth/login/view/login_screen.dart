import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';

import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

import 'package:gem_app2/feature/auth/login/view/widgets/login_form.dart';
import 'package:gem_app2/feature/auth/login/view/widgets/login_buttons.dart';
import 'package:gem_app2/feature/auth/widgets/logo_and_welcome_message.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
          width: context.deviceWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoAndWlcomeMessage(
                  tite: StringManager.welcomeBack,
                  description: StringManager.welcomemessage,
                ),
                AppSizedBox.h24,
                const LoginForm(),
                const LoginButtons(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: TextButton(
        onPressed: () {
          context.pushNamed(Routes.contactUsScreen);
        },
        child: CustomText(
          text: StringManager.contactUs,
          textDecoration: TextDecoration.underline,
          style: TextStyleManager.textStyle12w400,
          color: ColorsManager.white,
        ),
      ),
    );
  }
}
