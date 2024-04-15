import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class DetailsContainer extends StatelessWidget {
  final String title, value;
  const DetailsContainer({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.grayClr,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          CustomText(
            text: value,
            style: TextStyleManager.textStyle20w600,
            color: ColorsManager.yellowClr,
          ),
          CustomText(
            text: title,
            style: TextStyleManager.textStyle20w600,
            color: ColorsManager.white,
          ),
        ],
      ),
    );
  }
}
