import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/icon_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';
import 'package:gem_app2/feature/customer/workout/widgets/schedule_button.dart';

class WorkoutScreen extends StatelessWidget {
  final WorkoutModel item;
  const WorkoutScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    String svg = IconManager.bookmark;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            top: 0,
            child: Image.network(
              item.imageUrl!,
              width: context.deviceWidth,
              height: context.deviceHeight * 0.35,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: context.deviceHeight * 0.05,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.grayClr.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const BackButton(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: context.deviceHeight * 0.05,
            right: 10,
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return InkWell(
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
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: ColorsManager.grayClr.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      svg,
                      width: 24,
                      color: ColorsManager.yellowClr,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.deviceWidth,
              height: context.deviceHeight * 0.7,
              padding: EdgeInsets.all(25.r),
              decoration: const BoxDecoration(
                color: ColorsManager.darkgreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: item.title!,
                    style: TextStyleManager.textStyle25w700,
                  ),
                  CustomText(
                    text: "${item.workOutList.length} Workouts for Beginners",
                    style: TextStyleManager.textStyle18w400,
                  ),
                  AppSizedBox.h12,
                  ScheduleButton(
                    item: item,
                  ),
                  AppSizedBox.h12,
                  CustomText(
                    text: "Exercises",
                    style: TextStyleManager.textStyle20w600,
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.pushNamed(Routes.workoutStartScreen,
                                arguments: item);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorsManager.darkBrownClr,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: FractionallySizedBox(
                                heightFactor: 0.8,
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Image.network(
                                      item.imageUrl!,
                                      scale: 1 / 1,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),

                              title: CustomText(
                                textAlign: TextAlign.start,
                                text: "${item.workOutList[index].name}",
                                style: TextStyleManager.textStyle20w400,
                              ),
                              // subtitle: CustomText(
                              //   textAlign: TextAlign.start,
                              //   text: TimeConverter.getTotalTime(
                              //       startTime:
                              //           item.workOutList[index].startTime,
                              //       endTime: item.workOutList[index].endTime),
                              //   style: TextStyleManager.textStyle18w400,
                              // ),
                              trailing: const Icon(
                                Icons.arrow_circle_right_outlined,
                                color: ColorsManager.white,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return AppSizedBox.h12;
                      },
                      itemCount: item.workOutList.length,
                    ),
                  ),
                  AppSizedBox.h12,
                  CustomElevatedButton(
                      onPressed: () {},
                      child: CustomText(
                        text: "Start",
                        color: ColorsManager.darkgreen,
                        style: TextStyleManager.textStyle18w600,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
