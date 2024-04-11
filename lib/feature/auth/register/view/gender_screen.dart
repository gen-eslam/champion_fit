import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:gem_app2/feature/auth/register/view/widgets/gender/gender_group.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});
  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
          child: Column(
            children: [
              CustomText(
                text: StringManager.tellUsAboutYourself,
                style: TextStyleManager.textStyle32w700,
              ),
              CustomText(
                text: StringManager.gender,
                style: TextStyleManager.textStyle20w400,
              ),
              const GenderGroup(),
              CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.ageScreen);
                  print(RegisterCubit.get(context).user.toString());
                },
                child: CustomText(
                  text: StringManager.containue,
                  style: TextStyleManager.textStyle20w400,
                  color: ColorsManager.darkgreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
