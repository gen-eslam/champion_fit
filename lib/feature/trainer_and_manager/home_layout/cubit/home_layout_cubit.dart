import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/feature/personal/view/personal_data_screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';
import 'package:gem_app2/feature/trainer_and_manager/manager/manager_Screen.dart';
import 'package:gem_app2/feature/trainer_and_manager/trainer/trainer_home_screen.dart';

part 'homel_ayout_state.dart';

class TrainerAndMnanagerHomeLayoutCubit
    extends Cubit<TrainerAndManagerHomeLayoutState> {
  TrainerAndMnanagerHomeLayoutCubit({required this.homeLayoutRepo})
      : super(HomelayoutInitial());

  HomeLayoutRepo homeLayoutRepo;
  static TrainerAndMnanagerHomeLayoutCubit get(context) =>
      BlocProvider.of<TrainerAndMnanagerHomeLayoutCubit>(context);
  PageController pageController = PageController(
    initialPage: 0,
  );

  List<String> appBarTitles = [
    CacheService.getDataString(key: Keys.role) == "manager"
        ? StringManager.manager
        : StringManager.trainer,
    StringManager.personalData,
  ];
  List<Widget> screens = [
    CacheService.getDataString(key: Keys.role) == "manager"
        ? const ManagerScreen()
        : const TrainerHomeScreen(),
    const PersonalDataScreen(),
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
