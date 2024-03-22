import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  final String text;
  const OtpScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.start,
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
              const Pinput(),
            ],
          ),
        ),
      ),
    );
  }
}
