import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/icon_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

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
            labels: const ["Workouts", "Diet & nutrition plans"],
            selectedLabelIndex: (index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ),
        AppSizedBox.h10,
        Expanded(
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 10, // row
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return GridViewItem(
                  index: this.index,
                );
              }),
        ),
      ],
    );
  }
}

class GridViewItem extends StatefulWidget {
  final int index;

  const GridViewItem({
    super.key,
    required this.index,
  });

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
            if (widget.index == 1) {
              context.pushNamed(Routes.foodDetailsScreen);
            } else {
              context.pushNamed(Routes.workoutScreen);
            }
          },
          child: Container(
            width: context.deviceWidth * 0.5,
            decoration: BoxDecoration(
              color: ColorsManager.grayClr,
              image: DecorationImage(
                image: NetworkImage(
                  widget.index == 0
                      ? "https://images.ctfassets.net/90pc6zknij8o/6kOrrUlbFu9IXAiFmtrLLA/359dc29aba15362528d3d0e4331c4244/Fitness_Male_Push-Up_Claudius_002-e1544444635307.jpg?w=900&h=591&q=50&fm=webp&fit=fill&f=faces"
                      : "https://www.uab.edu/news/images/2018/Five_tips_Stream.jpg",
                  scale: 1 / 1,
                ),
                fit: BoxFit.cover,
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
                    text:
                        "WorkoutWorkoutWorkoutWorkoutWorkoutWorkoutWorkoutWorkoutWorkoutWorkout",
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
