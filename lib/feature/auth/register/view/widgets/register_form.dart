import 'package:flutter/material.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            text: StringManager.userName,
            controller: RegisterCubit.get(context).nameController,
            prefixIcon: Icons.account_circle_outlined,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Enter your name";
              }
              return null;
            },
          ),
          AppSizedBox.h24,
          CustomTextFormFeild(
            text: StringManager.emailAdress,
            controller: RegisterCubit.get(context).emailController,
            prefixIcon: Icons.email,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Enter your email";
              }
              return null;
            },
          ),
          AppSizedBox.h24,
          CustomTextFormFeild(
            text: StringManager.password,
            prefixIcon: Icons.password,
            controller: RegisterCubit.get(context).passwordController,
            isPassword: true,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Enter your password";
              }
              return null;
            },
          ),
          AppSizedBox.h24,
          CustomTextFormFeild(
            text: StringManager.confirmPassword,
            prefixIcon: Icons.password,
            isPassword: true,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Enter your password";
              } else if (RegisterCubit.get(context).passwordController.text !=
                  p0) {
                return "passwords don't match";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
