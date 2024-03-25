import 'package:flutter/material.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormFeild(
            text: StringManager.emailAdress,
            prefixIcon: Icons.email,
          ),
          AppSizedBox.h24,
          const CustomTextFormFeild(
            text: StringManager.password,
            prefixIcon: Icons.password,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
