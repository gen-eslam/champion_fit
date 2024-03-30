import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/cubit/home_layout_cubit.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/view/trainer_home_screen.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TrainerAndManagerLayoutScreen extends StatefulWidget {
  const TrainerAndManagerLayoutScreen({super.key});

  @override
  State<TrainerAndManagerLayoutScreen> createState() =>
      _TrainerAndManagerLayoutScreenState();
}

class _TrainerAndManagerLayoutScreenState
    extends State<TrainerAndManagerLayoutScreen> {
  late TrainerAndMnanagerHomeLayoutCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = TrainerAndMnanagerHomeLayoutCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerAndMnanagerHomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: CustomText(
              text: cubit.appBarTitles[cubit.currentIndex],
              style: TextStyleManager.textStyle18w600,
            ),
          ),
          body: PageView.builder(
            controller: cubit.pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.screens.length,
            onPageChanged: (value) {
              cubit.changePage(index: value);
            },
            itemBuilder: (context, index) {
              return cubit.screens[index];
            },
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changePageOnTab(index: value);
            },
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: CustomText(
                  text: StringManager.home,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: CustomText(
                  text: StringManager.profile,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
