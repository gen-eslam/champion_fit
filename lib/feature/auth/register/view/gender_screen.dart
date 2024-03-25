import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

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
              const GenderSelection(
                title: StringManager.male,
                imagePath: ImagesManager.male,
                onTap: null,
              ),
              const GenderSelection(
                title: StringManager.female,
                imagePath: ImagesManager.female,
                onTap: null,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    context.pushNamed(Routes.hightScreen);
                  },
                  child: CustomText(
                    text: StringManager.containue,
                    style: TextStyleManager.textStyle20w400,
                    color: ColorsManager.darkgreen,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSelection extends StatelessWidget {
  const GenderSelection({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.title,
  });

  final void Function()? onTap;
  final String imagePath, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(30.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: ColorsManager.white,
            )),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              scale: 1 / 1,
              width: context.deviceWidth * 0.3,
            ),
            CustomText(
              text: title,
              style: TextStyleManager.textStyle20w400,
            ),
          ],
        ),
      ),
    );
  }
}
