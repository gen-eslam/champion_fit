import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/feature/customer/workout_progress/widgets/chart/bar_graph.dart';

class MainBarChart extends StatefulWidget {
  const MainBarChart({super.key});

  @override
  State<MainBarChart> createState() => _MainBarChartState();
}

// ! https://www.youtube.com/watch?v=8j6iw33bJU0
class _MainBarChartState extends State<MainBarChart> {
  List<double> weeklySummary = [4.40, 2.50, 42.20, 10.70, 100, 88.40, 90.50];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      clipBehavior: Clip.none,
      width: context.deviceWidth,
      child: MyBarGraph(weeklySummary: weeklySummary),
    );
  }
}
