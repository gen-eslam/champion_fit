import 'package:gem_app2/feature/customer/workout_progress/widgets/chart/individual_bar.dart';

class WeeksBarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  WeeksBarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];
  //* init bar data
  void initBarData() {
    barData.add(IndividualBar(x: 0, y: sunAmount));
    barData.add(IndividualBar(x: 1, y: monAmount));
    barData.add(IndividualBar(x: 2, y: tueAmount));
    barData.add(IndividualBar(x: 3, y: wedAmount));
    barData.add(IndividualBar(x: 4, y: thuAmount));
    barData.add(IndividualBar(x: 5, y: friAmount));
    barData.add(IndividualBar(x: 6, y: satAmount));
  }
}
