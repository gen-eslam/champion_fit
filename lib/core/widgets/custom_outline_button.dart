import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.r),
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p48, vertical: AppPadding.p12),
          side: const BorderSide(
            color: ColorsManager.yellowClr,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppPadding.p16,
            ),
          )),
      child: CustomText(
        text: text,
        style: TextStyleManager.textStyle18w600,
        color: ColorsManager.yellowClr,
      ),
    );
  }
}
