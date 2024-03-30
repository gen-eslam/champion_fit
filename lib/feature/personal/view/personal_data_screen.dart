import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
          width: context.deviceWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  ImagesManager.logo,
                  scale: 1 / 1,
                  width: context.deviceWidth * 0.35,
                ),
                AppSizedBox.h48,
                const CustomTextFormFeild(
                  text: "UserName",
                  prefixIcon: Icons.email,
                  initialValue: "UserName",
                  filled: true,
                  haveBorder: false,
                  fillColor: Color(0xff434B53),
                  readOnly: true,
                ),
                AppSizedBox.h48,
                const CustomTextFormFeild(
                  text: "E-mail",
                  prefixIcon: Icons.email,
                  filled: true,
                  haveBorder: false,
                  fillColor: Color(0xff434B53),
                  initialValue: "k3z1V@example.com",
                  readOnly: true,
                ),
                AppSizedBox.h48,
                const CustomTextFormFeild(
                  text: "Phone",
                  filled: true,
                  haveBorder: false,
                  fillColor: Color(0xff434B53),
                  prefixIcon: Icons.phone,
                  initialValue: "01551953697",
                  readOnly: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
