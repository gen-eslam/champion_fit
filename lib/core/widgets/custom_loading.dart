import 'package:flutter/material.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: ColorsManager.yellowClr,
    ));
  }
}
