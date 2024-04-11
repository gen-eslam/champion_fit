import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:gem_app2/feature/auth/register/view/widgets/custom_whell_slider.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int currentIndex = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
          child: Column(
            children: [
              CustomText(
                text: StringManager.howOldAreYou,
                style: TextStyleManager.textStyle32w700,
              ),
              AppSizedBox.h16,
              CustomText(
                text:
                    "Age in years. his will help us to personalize an excrise program plan that suits you.",
                style: TextStyleManager.textStyle20w400,
              ),
              AppSizedBox.h16,
              CustomWhellSlider(
                itemSize: 40,
                currentIndex: currentIndex,
                initValue: 25,
                totalCount: 80,
                horizontal: false,
                showPointer: true,
                onValueChanged: (val) {
                  currentIndex = val;
                  RegisterCubit.get(context).user.age = val;
                  setState(() {});
                },
                customPointer: Container(
                  height: 30.h,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorsManager.white,
                        width: 1,
                      ),
                      top: BorderSide(
                        color: ColorsManager.white,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              AppSizedBox.h16,
              CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.hightScreen);
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
