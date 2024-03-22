import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';

import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

import 'package:gem_app2/feature/login/view/widgets/login_and_password.dart';
import 'package:gem_app2/feature/login/view/widgets/login_buttons.dart';
import 'package:gem_app2/feature/login/view/widgets/logo_and_welcome_message.dart';

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
           
                const LogoAndWlcomeMessage(),
                AppSizedBox.h24,
                const EmailAndPassword(),
                const LoginButtons(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: TextButton(
        onPressed: () {},
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
