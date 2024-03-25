import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:wheel_slider/wheel_slider.dart';

class HightScreen extends StatelessWidget {
  const HightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hight;
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
                text: StringManager.heightInCm,
                style: TextStyleManager.textStyle20w400,
              ),
              AppSizedBox.h16,
              const CustomWhellSlider(),
              AppSizedBox.h16,
              CustomElevatedButton(
                onPressed: () {},
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

class CustomWhellSlider extends StatelessWidget {
  const CustomWhellSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WheelSlider.number(
      horizontal: false,
      verticalListHeight: context.deviceHeight * 0.4,
      pointerColor: Colors.white,
      selectedNumberStyle: TextStyleManager.textStyle15w700.copyWith(
        color: ColorsManager.yellowClr,
      ),
      pointerHeight: 10,
      pointerWidth: 10,
      isInfinite: false,
      unSelectedNumberStyle:
          TextStyleManager.textStyle15w700.copyWith(color: ColorsManager.white),
      totalCount: 250,
      showPointer: true,
      initValue: 150,
      currentIndex: 150,
      squeeze: 1,
      allowPointerTappable: false,
      perspective: 0.002,
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
        )),
      ),
      onValueChanged: (val) {},
    );
  }
}
