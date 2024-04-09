import 'package:gem_app2/feature/customer/workout_progress/widgets/chart/individual_bar.dart';

class MonthBarData {
  double janAmount;
  double febAmount;
  double marAmount;
  double aprAmount;
  double mayAmount;
  double junAmount;
  double julAmount;
  double augAmount;
  double sepAmount;
  double octAmount;
  double novAmount;
  double decAmount;

  MonthBarData({
    required this.janAmount,
    required this.febAmount,
    required this.marAmount,
    required this.aprAmount,
    required this.mayAmount,
    required this.junAmount,
    required this.julAmount,
    required this.augAmount,
    required this.sepAmount,
    required this.octAmount,
    required this.novAmount,
    required this.decAmount,
  });
  List<IndividualBar> monthBarData = [];

  void initBarData() {
    monthBarData.add(IndividualBar(x: 0, y: janAmount));
    monthBarData.add(IndividualBar(x: 1, y: febAmount));
    monthBarData.add(IndividualBar(x: 2, y: marAmount));
    monthBarData.add(IndividualBar(x: 3, y: aprAmount));
    monthBarData.add(IndividualBar(x: 4, y: mayAmount));
    monthBarData.add(IndividualBar(x: 5, y: junAmount));
    monthBarData.add(IndividualBar(x: 6, y: julAmount));
    monthBarData.add(IndividualBar(x: 7, y: augAmount));
    monthBarData.add(IndividualBar(x: 8, y: sepAmount));
    monthBarData.add(IndividualBar(x: 9, y: octAmount));
    monthBarData.add(IndividualBar(x: 10, y: novAmount));
    monthBarData.add(IndividualBar(x: 11, y: decAmount));
  }
}
