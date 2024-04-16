import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/feature/customer/customer_home/customer_home_screen.dart';
import 'package:gem_app2/feature/customer/customer_personal/customer_personal_screen.dart';
import 'package:gem_app2/feature/customer/daily_workout_schedule/daily_workout_schedule_screen.dart';
import 'package:gem_app2/feature/customer/workout_progress/workout_progress_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';

part 'customer_home_layout_state.dart';

class CustomerHomeLayoutCubit extends Cubit<CustomerHomeLayoutState> {
  final HomeLayoutRepo homeLayoutRepo;
  CustomerHomeLayoutCubit({required this.homeLayoutRepo})
      : super(HomeLayoutInitial());

  static CustomerHomeLayoutCubit get(context) =>
      BlocProvider.of<CustomerHomeLayoutCubit>(context);
  PageController pageController = PageController(
    // keepPage: true,
    initialPage: 0,
  );

  /// appBarTitles
  List<String> appBarTitles = [
    "fares",
    "fares",
    "fares",
    "fares",
  ];
  List screens = [
    const CustomerHomeScreen(),
    const WorkoutProgressScreen(),
    const DailyWorkoutScheduleScreen(),
    const CustomerPersonalScreen(),
  ];
  int currentIndex = 0;

  void changePage({required int index}) {
    currentIndex = homeLayoutRepo.changePage(index: index);
    emit(HomeLayoutChangePage());
  }

  void changePageOnTab({required int index}) async {
    changePage(index: index);
    await pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.linear,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
