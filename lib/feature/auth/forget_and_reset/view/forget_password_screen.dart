import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';
import 'package:gem_app2/feature/auth/forget_and_reset/cubit/forget_password_cubit.dart';
import 'package:gem_app2/feature/auth/widgets/submit_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Form(
          key: ForgetpasswordCubit.get(context).formKey,
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
              CustomTextFormFeild(
                text: StringManager.emailAdress,
                prefixIcon: Icons.email,
                controller: ForgetpasswordCubit.get(context).emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your email";
                  }
                  return null;
                },
              ),
              AppSizedBox.h24,
              SubmitButtom(onPressed: () {
                if (ForgetpasswordCubit.get(context)
                    .formKey
                    .currentState!
                    .validate()) {
                  ForgetpasswordCubit.get(context).sendResetLink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
