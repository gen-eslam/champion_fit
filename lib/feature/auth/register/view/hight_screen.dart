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

class HightScreen extends StatefulWidget {
  const HightScreen({super.key});

  @override
  State<HightScreen> createState() => _HightScreenState();
}

class _HightScreenState extends State<HightScreen> {
  int _currentHeight = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
          child: Column(
            children: [
              CustomText(
                text: "What is Your Height?",
                style: TextStyleManager.textStyle32w700,
              ),
              AppSizedBox.h16,
              CustomText(
                text:
                    "Height in cm. Don’t worry, you can always change it later",
                style: TextStyleManager.textStyle20w400,
              ),
              AppSizedBox.h16,
              CustomWhellSlider(
                itemSize: 40,
                currentIndex: _currentHeight,
                initValue: 150,
                totalCount: 300,
                horizontal: false,
                showPointer: true,
                onValueChanged: (val) {
                  _currentHeight = val;
                  RegisterCubit.get(context).user.height = val;
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
                  context.pushNamed(Routes.weightScreen);
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
