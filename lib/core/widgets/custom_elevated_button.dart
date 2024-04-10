import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  const CustomElevatedButton({
    super.key,
    required this.child,
    this.color = ColorsManager.yellowClr,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppPadding.p16,
            ),
          ),
          minimumSize: Size(double.infinity, 50.r),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p48,
            vertical: AppPadding.p12,
          ),
          backgroundColor: color,
        ),
        child: child);
  }
}
