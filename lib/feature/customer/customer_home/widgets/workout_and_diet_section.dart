import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:gem_app2/core/fake_data.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/icon_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_loading.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_home/cubit/workout_and_diet_cubit.dart';
import 'package:gem_app2/feature/customer/customer_home/model/diet_model.dart';
import 'package:gem_app2/feature/customer/customer_home/widgets/diet_item.dart';
import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';
import 'package:gem_app2/video/you_tube_controller.dart';

class WorkoutAndDietSection extends StatefulWidget {
  const WorkoutAndDietSection({
    super.key,
  });

  @override
  State<WorkoutAndDietSection> createState() => _WorkoutAndDietSectionState();
}

class _WorkoutAndDietSectionState extends State<WorkoutAndDietSection> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: FlutterToggleTab(
            height: 40,
            isScroll: false,
            unSelectedBackgroundColors: const [
              ColorsManager.grayClr,
            ],
            isShadowEnable: true,
            borderRadius: 15,
            selectedIndex: index,
            selectedTextStyle: TextStyleManager.textStyle15w700.copyWith(
              color: ColorsManager.darkgreen,
            ),
            unSelectedTextStyle: TextStyleManager.textStyle14w600.copyWith(
              color: ColorsManager.white,
            ),
            labels: const [
              "Workouts",
              "Diet & nutrition plans",
            ],
            selectedLabelIndex: (index) {
              setState(() {
                this.index = index;
                print(index);
              });
            },
          ),
        ),
        AppSizedBox.h10,
        Expanded(
          child: PageView.builder(
              // itemCount: 2,
              controller: PageController(initialPage: 0),
              physics: const NeverScrollableScrollPhysics(),

              // onPageChanged: (value) {
              //   setState(() {
              //     index = value;
              //   });
              // },
              itemBuilder: (context, _) {
                if (index == 0) {
                  return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: fakeWorkOuts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1,
                        mainAxisSpacing: 10, // row
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GridViewItem(
                          item: fakeWorkOuts[index],
                        );
                      });
                } else {
                  return BlocBuilder<WorkoutAndDiteCubit, WorkoutAndDiteState>(
                    builder: (context, state) {
                      if (state is DietDataLoaded) {
                        return GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.dietList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1,
                              mainAxisSpacing: 10, // row
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return DietItem(
                                item: state.dietList[index],
                              );
                            });
                      } else if (state is DietDataError) {
                        return CustomText(
                          text: state.message,
                          style: TextStyleManager.textStyle18w600,
                        );
                      } else {
                        return const CustomLoading();
                      }
                    },
                  );
                }
              }),
        ),
      ],
    );
  }
}

class GridViewItem extends StatefulWidget {
  final WorkOutModel item;
  const GridViewItem({super.key, required this.item});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  String svg = IconManager.bookmark;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(Routes.workoutScreen, arguments: widget.item);
          },
          child: Container(
            width: context.deviceWidth * 0.5,
            decoration: BoxDecoration(
              color: ColorsManager.grayClr,
              image: DecorationImage(
                image: NetworkImage(
                  YouTube.getThumbnail(
                    YouTube.getVideoId(
                      widget.item.url,
                    )!,
                  )!,
                  // scale: 1 / 1,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: InkWell(
            onTap: () {
              if (svg == IconManager.bookmark) {
                setState(() {
                  svg = IconManager.bookMarkFilled;
                });
              } else {
                setState(() {
                  svg = IconManager.bookmark;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                color: ColorsManager.grayClr.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(
                svg,
                width: 24,
                color: ColorsManager.yellowClr,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            constraints: BoxConstraints(maxWidth: context.deviceWidth * 0.35),
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: ColorsManager.grayClr.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.r,
                  ),
                  height: 15.r,
                  width: 1,
                  color: ColorsManager.yellowClr,
                ),
                Expanded(
                  child: CustomText(
                    text: widget.item.title,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    style: TextStyleManager.textStyle12w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
