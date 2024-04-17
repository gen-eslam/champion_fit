import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/icon_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/cubit/home_layout_cubit.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TrainerAndManagerLayoutScreen extends StatefulWidget {
  const TrainerAndManagerLayoutScreen({super.key});

  @override
  State<TrainerAndManagerLayoutScreen> createState() =>
      _TrainerAndManagerLayoutScreen();
}

class _TrainerAndManagerLayoutScreen
    extends State<TrainerAndManagerLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrainerAndMnanagerHomeLayoutCubit(
            homeLayoutRepo: HomeLayoutRepoImpl()),
        child: BlocBuilder<TrainerAndMnanagerHomeLayoutCubit,
            TrainerAndManagerHomeLayoutState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: CustomText(
                  text: TrainerAndMnanagerHomeLayoutCubit.get(context)
                          .appBarTitles[
                      TrainerAndMnanagerHomeLayoutCubit.get(context)
                          .currentIndex],
                  style: TextStyleManager.textStyle18w600,
                ),
              ),
              body: PageView.builder(
                controller: TrainerAndMnanagerHomeLayoutCubit.get(context)
                    .pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: TrainerAndMnanagerHomeLayoutCubit.get(context)
                    .screens
                    .length,
                onPageChanged: (value) {
                  TrainerAndMnanagerHomeLayoutCubit.get(context)
                      .changePage(index: value);
                },
                //TrainerAndManagerLayoutScreen
                itemBuilder: (context, index) {
                  return TrainerAndMnanagerHomeLayoutCubit.get(context)
                      .screens[index];
                },
              ),
              bottomNavigationBar: SalomonBottomBar(
                currentIndex:
                    TrainerAndMnanagerHomeLayoutCubit.get(context).currentIndex,
                onTap: (value) {
                  TrainerAndMnanagerHomeLayoutCubit.get(context)
                      .changePageOnTab(index: value);
                },
                items: [
                  SalomonBottomBarItem(
                    selectedColor: ColorsManager.yellowClr,
                    activeIcon: SvgPicture.asset(IconManager.home,
                        width: 25.r, color: ColorsManager.yellowClr),
                    icon: SvgPicture.asset(IconManager.home, width: 25.r),
                    title: CustomText(
                      text: StringManager.home,
                      style: TextStyleManager.textStyle15w500,
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: SvgPicture.asset(IconManager.profile, width: 25.r),
                    activeIcon: SvgPicture.asset(IconManager.profile,
                        width: 25.r, color: ColorsManager.yellowClr),
                    title: CustomText(
                      text: StringManager.profile,
                      style: TextStyleManager.textStyle15w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
