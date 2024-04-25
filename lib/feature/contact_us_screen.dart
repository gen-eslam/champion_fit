import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';
import 'package:gem_app2/feature/auth/widgets/logo_and_welcome_message.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
          width: context.deviceWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoAndWlcomeMessage(
                  tite: StringManager.contactUs,
                  description: "",
                ),
                const CustomTextFormFeild(
                  text: "Phone",
                  prefixIcon: Icons.phone,
                  initialValue: "1234567890",
                  readOnly: true,
                ),
                AppSizedBox.h48,
                const CustomTextFormFeild(
                  text: "Address",
                  prefixIcon: Icons.location_on,
                  initialValue: "123, Street, City, Country",
                  readOnly: true,
                ),
                AppSizedBox.h48,
                const CustomTextFormFeild(
                  text: "E-mail",
                  prefixIcon: Icons.email,
                  initialValue: "k3z1V@example.com",
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
