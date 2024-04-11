import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_snak_bar.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:gem_app2/feature/auth/register/view/widgets/register_form.dart';

import 'package:gem_app2/feature/auth/widgets/logo_and_welcome_message.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            context.pushNamed(
              Routes.genderScreen,
            );
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                text: state.message,
                colorState: ColorState.failure,
              ),
            );
          }
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
            width: context.deviceWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LogoAndWlcomeMessage(
                    tite: StringManager.welcomeRegister,
                    description: StringManager.welcomemessage,
                  ),
                  AppSizedBox.h24,
                  const RegisterForm(),
                  AppSizedBox.h24,
                  CustomElevatedButton(
                    onPressed: () {
                      if (RegisterCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        RegisterCubit.get(context).register();

                      }
                      print(RegisterCubit.get(context).user.toString());

                      // context.pushNamed(
                      //   Routes.profilePhoto,
                      // );
                    },
                    child: CustomText(
                      text: StringManager.createAccount,
                      color: ColorsManager.darkgreen,
                      style: TextStyleManager.textStyle15w700,
                    ),
                  ),
                  AppSizedBox.h24,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: RichText(
                      text: TextSpan(
                        text: StringManager.alreadyHaveAccount,
                        style: TextStyleManager.textStyle18w400
                            .copyWith(color: ColorsManager.white),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                            text: StringManager.signIn,
                            style: TextStyleManager.textStyle18w400
                                .copyWith(color: ColorsManager.yellowClr),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
