import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/workout_progress/widgets/chart/main_bar_chart.dart';
import 'package:gem_app2/feature/customer/workout_progress/widgets/drop_down_progress.dart';
import 'package:gem_app2/feature/customer/workout_progress/widgets/latest_workout_progress_item.dart';

class WorkoutProgressScreen extends StatelessWidget {
  const WorkoutProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.deviceWidth,
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: "Workout Progress",
                    style: TextStyleManager.textStyle24w700,
                  ),
                  const Spacer(),
                  const DropDownProgress(),
                ],
              ),
              const MainBarChart(),

              //Latest Workout
              CustomText(
                text: "Latest Workout",
                textAlign: TextAlign.start,
                style: TextStyleManager.textStyle24w700,
              ),

              SizedBox(height: 10.h),
              const LatestWorkoutItem(),
            ],
          ),
        ),
      ),
    );
  }
}
