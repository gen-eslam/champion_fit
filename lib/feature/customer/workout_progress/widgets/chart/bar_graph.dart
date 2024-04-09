import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/feature/customer/workout_progress/widgets/chart/week_bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List<double> weeklySummary;

  const MyBarGraph({
    super.key,
    required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    //* init bar data
    WeeksBarData barData = WeeksBarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thuAmount: weeklySummary[3],
      friAmount: weeklySummary[4],
      satAmount: weeklySummary[5],
    );
    barData.initBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(
          show: false, //* hide grid lines
        ),
        borderData: FlBorderData(show: false), //* hide border
        // * show titles
        titlesData: FlTitlesData(
          show: true,
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30.r, // *size
            getTitlesWidget: getBottomTitlesWidget,
          )),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        //* bar group
        barGroups: barData.barData
            .map(
              (data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y, //* height of the bar
                    width: 25.r, //* width of the bar
                    color: ColorsManager.yellowClr, //* color of the bar
                    //* back show color for space
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: ColorsManager.grayClr,
                    )),
              ]),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    color: ColorsManager.yellowClr,
    fontWeight: FontWeight.bold,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Sun', style: style);
      break;
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 2:
      text = const Text('Tue', style: style);
      break;
    case 3:
      text = const Text('Wen', style: style);
      break;
    case 4:
      text = const Text('Th', style: style);
      break;
    case 5:
      text = const Text('Fir', style: style);
      break;
    case 6:
      text = const Text('Sat', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}
