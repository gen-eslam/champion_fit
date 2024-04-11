import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class GenderSelection extends StatelessWidget {
  GenderSelection({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.title,
    required this.gender,
    required this.selectedGender,
  });

  final void Function()? onTap;
  final String imagePath, title;
  Gender gender, selectedGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(30.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: gender.name == selectedGender.name
                  ? ColorsManager.yellowClr
                  : ColorsManager.white,
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
