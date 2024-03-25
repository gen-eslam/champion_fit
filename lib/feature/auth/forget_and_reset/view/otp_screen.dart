import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';

import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/auth/widgets/submit_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  final String text;
  const OtpScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                text: StringManager.enterOtp,
                style: TextStyleManager.textStyle32w700,
              ),
              AppSizedBox.h16,
              CustomText(
                text: StringManager.otpMessage,
                style: TextStyleManager.textStyle20w400,
              ),
              AppSizedBox.h4,
              CustomText(
                text: text,
                style: TextStyleManager.textStyle20w400,
              ),
              AppSizedBox.h32,
              const CustomPinPut(),
              AppSizedBox.h32,
              SubmitButtom(onPressed: () {
                context.pushNamed(Routes.resetPasswordScreen);
              }),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        child: TextButton(
          onPressed: () {},
          child: CustomText(
            text: StringManager.sendAgain,
            style: TextStyleManager.textStyle18w600,
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      followingPinTheme: PinTheme(
        width: context.deviceWidth * 0.15,
        height: context.deviceWidth * 0.15,
        textStyle: TextStyleManager.textStyle24w500,
        decoration: BoxDecoration(
          //color: ColorsManager.yellowClr,
          borderRadius: BorderRadius.circular(15),

          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
            left: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
            right: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
            top: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
          ),
        ),
      ),
      defaultPinTheme: PinTheme(
        width: context.deviceWidth * 0.15,
        height: context.deviceWidth * 0.15,
        textStyle: TextStyleManager.textStyle24w500,
        decoration: BoxDecoration(
          color: ColorsManager.yellowClr,
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
            left: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
            right: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
            top: BorderSide(
              color: ColorsManager.yellowClr,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
