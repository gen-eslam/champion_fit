import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/core/widgets/custom_text_form_field.dart';
import 'package:gem_app2/feature/customer/customer_personal/cubit/coustomer_personal_cubit.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CoustomerPersonalCubit()..getUserData(),
        child: BlocBuilder<CoustomerPersonalCubit, CoustomerPersonalState>(
          builder: (context, state) {
            if (state is GetCustomerDataSuccess) {
              return SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                  width: context.deviceWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: context.deviceWidth * 0.20,
                          backgroundImage: NetworkImage(
                            state.userModel.imageUrl!,
                            scale: 1 / 1,
                          ),
                        ),
                        AppSizedBox.h48,
                        CustomTextFormFeild(
                          text: "UserName",
                          prefixIcon: Icons.verified_user,
                          initialValue: state.userModel.userName,
                          filled: true,
                          haveBorder: false,
                          fillColor: const Color(0xff434B53),
                          readOnly: true,
                        ),
                        AppSizedBox.h48,
                        CustomTextFormFeild(
                          text: "E-mail",
                          prefixIcon: Icons.email,
                          filled: true,
                          haveBorder: false,
                          fillColor: const Color(0xff434B53),
                          initialValue: state.userModel.email,
                          readOnly: true,
                        ),
                        AppSizedBox.h48,
                        CustomTextFormFeild(
                          text: "role",
                          filled: true,
                          haveBorder: false,
                          fillColor: const Color(0xff434B53),
                          prefixIcon: Icons.man_3_outlined,
                          initialValue: state.userModel.role,
                          readOnly: true,
                        ),
                        SizedBox(height: 20.h),
                        CustomElevatedButton(
                          color: ColorsManager.redClr,
                          child: CustomText(
                            text: "Logout",
                            style: TextStyleManager.textStyle18w600,
                          ),
                          onPressed: () {
                            CacheService.clearData();
                            context.pushNamedAndRemoveUntil(
                              Routes.loginScreen,
                              predicate: (route) => false,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is GetCustomerDataError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
