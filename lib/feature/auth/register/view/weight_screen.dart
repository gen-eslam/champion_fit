import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:gem_app2/feature/auth/register/view/widgets/custom_whell_slider.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 30.h,
              bottom: context.deviceHeight * 0.25),
          child: Column(
            children: [
              AppSizedBox.h48,
              CustomText(
                text: StringManager.whatIsYourWeight,
                style: TextStyleManager.textStyle32w700,
              ),
              AppSizedBox.h48,
              CustomText(
                text: StringManager.weightInKg,
                style: TextStyleManager.textStyle20w400,
              ),
              const Spacer(),
              CustomWhellSlider(
                itemSize: 60,
                currentIndex: weight,
                initValue: 50,
                totalCount: 150,
                horizontal: true,
                showPointer: false,
                onValueChanged: (val) {
                  weight = val;
                  RegisterCubit.get(context).user.weight = val;
                  setState(() {});
                },
                customPointer: null,
              ),
              AppSizedBox.h12,
              Image.asset(ImagesManager.poly),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.profilePhoto);
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
