import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';
import 'package:gem_app2/video/video_player.dart';

class WorkoutStartScreen extends StatefulWidget {
  final WorkoutModel item;
  

  const WorkoutStartScreen({super.key, required this.item});

  @override
  State<WorkoutStartScreen> createState() => _WorkoutStartScreenState();
}

class _WorkoutStartScreenState extends State<WorkoutStartScreen> {
  PageController pageController =
      PageController(initialPage: 0, keepPage: false);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Expanded(
        child: PageView.builder(
            itemCount: widget.item.workOutList.length,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: widget.item.workOutList[index].name!,
                      style: TextStyleManager.textStyle24w700),
                  SizedBox(height: 30.h),
                  VideoPlayerWidget(
                    videoUrl: widget.item.workOutList[index].url!,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.r),
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (pageController.position.haveDimensions) {
                          pageController.page ==
                                  widget.item.workOutList.length - 1
                              ? [context.pop(), context.pop()]
                              : pageController.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.linear);
                        }
                      },
                      child: CustomText(
                        text: pageController.position.haveDimensions &&
                                pageController.page ==
                                    widget.item.workOutList.length - 1
                            ? "finish"
                            : "Next",
                        color: ColorsManager.darkgreen,
                        style: TextStyleManager.textStyle18w600,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorsManager.grayClr.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const BackButton(
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: ColorsManager.grayClr.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomText(
                text: "Warming Up",
                style: TextStyleManager.textStyle18w400,
              ),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.h);
}
