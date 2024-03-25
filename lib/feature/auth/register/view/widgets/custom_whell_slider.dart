import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:wheel_slider/wheel_slider.dart';

class CustomWhellSlider extends StatelessWidget {
  final Widget? customPointer;
  final bool showPointer;
  final bool horizontal;

  final dynamic Function(dynamic) onValueChanged;
  final int initValue, totalCount, currentIndex;
  final double itemSize;
  const CustomWhellSlider({
    super.key,
    required this.customPointer,
    required this.showPointer,
    required this.initValue,
    required this.totalCount,
    required this.currentIndex,
    required this.onValueChanged,
    required this.horizontal,
    required this.itemSize,
  });

  @override
  Widget build(BuildContext context) {
    return WheelSlider.number(
      horizontal: horizontal,
      verticalListHeight: context.deviceHeight * 0.4,
      pointerColor: Colors.white,
      selectedNumberStyle: TextStyleManager.textStyle18w600.copyWith(
        color: ColorsManager.yellowClr,
      ),
      pointerHeight: 10,
      pointerWidth: 10,
      itemSize: itemSize,
      isInfinite: false,
      unSelectedNumberStyle:
          TextStyleManager.textStyle15w700.copyWith(color: Colors.grey),
      totalCount: totalCount,
      showPointer: showPointer,
      initValue: initValue,
      currentIndex: currentIndex,
      squeeze: 1,
      allowPointerTappable: false,
      perspective: 0.002,
      customPointer: customPointer,
      onValueChanged: onValueChanged,
    );
  }
}
