// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:gem_app2/core/theme/manager/colors_manager.dart';
// import 'package:gem_app2/feature/customer/workout_progress/widgets/chart/month/month_bar_data.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class MainMonthBarChar extends StatefulWidget {
//   const MainMonthBarChar({super.key});

//   @override
//   State<MainMonthBarChar> createState() => _MainMonthBarCharState();
// }

// class _MainMonthBarCharState extends State<MainMonthBarChar> {
//   MonthBarData monthBarData = MonthBarData(

//   );
//   BarChartGroupData generateGroupData(
//     int x,
//   ) {
//     return BarChartGroupData(
//       x: x,
//       groupVertically: true,
//       barRods: [
//         BarChartRodData(
//           toY: 50,
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 100,
//             color: ColorsManager.grayClr,
//           ),
//           color: ColorsManager.yellowClr,
//           width: 10,
//         ),
//       ],
//     );
//   }

//   Widget bottomTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontSize: 12,
//       color: ColorsManager.yellowClr,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 0:
//         text = 'JAN';
//         break;
//       case 1:
//         text = 'FEB';
//         break;
//       case 2:
//         text = 'MAR';
//         break;
//       case 3:
//         text = 'APR';
//         break;
//       case 4:
//         text = 'MAY';
//         break;
//       case 5:
//         text = 'JUN';
//         break;
//       case 6:
//         text = 'JUL';
//         break;
//       case 7:
//         text = 'AUG';
//         break;
//       case 8:
//         text = 'SEP';
//         break;
//       case 9:
//         text = 'OCT';
//         break;
//       case 10:
//         text = 'NOV';
//         break;
//       case 11:
//         text = 'DEC';
//         break;
//       default:
//         text = '';
//     }
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(text, style: style),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 14),
//           AspectRatio(
//             aspectRatio: 2,
//             child: BarChart(
//               BarChartData(
//                 minY: 0,
//                 maxY: 100,

//                 alignment: BarChartAlignment.spaceBetween,
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(),
//                   rightTitles: AxisTitles(),
//                   topTitles: AxisTitles(),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: bottomTitles,
//                       reservedSize: 20,
//                     ),
//                   ),
//                 ),
//                 barTouchData: BarTouchData(enabled: false),
//                 borderData: FlBorderData(show: false),
//                 gridData: FlGridData(show: false),
//                 barGroups: [
//                   generateGroupData(
//                     0,
//                   ),
//                   generateGroupData(
//                     1,
//                   ),
//                   generateGroupData(
//                     2,
//                   ),
//                   generateGroupData(
//                     3,
//                   ),
//                   generateGroupData(
//                     4,
//                   ),
//                   generateGroupData(
//                     5,
//                   ),
//                   generateGroupData(
//                     6,
//                   ),
//                   generateGroupData(
//                     7,
//                   ),
//                   generateGroupData(
//                     8,
//                   ),
//                   generateGroupData(
//                     9,
//                   ),
//                   generateGroupData(
//                     10,
//                   ),
//                   generateGroupData(
//                     11,
//                   ),
//                 ],

//                 // extraLinesData: ExtraLinesData(
//                 //   horizontalLines: [
//                 //     HorizontalLine(
//                 //       y: 3.3,
//                 //       color: pilateColor,
//                 //       strokeWidth: 1,
//                 //       dashArray: [20, 4],
//                 //     ),
//                 //     HorizontalLine(
//                 //       y: 8,
//                 //       color: quickWorkoutColor,
//                 //       strokeWidth: 1,
//                 //       dashArray: [20, 4],
//                 //     ),
//                 //     HorizontalLine(
//                 //       y: 11,
//                 //       color: cyclingColor,
//                 //       strokeWidth: 1,
//                 //       dashArray: [20, 4],
//                 //     ),
//                 //   ],
//                 // ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
