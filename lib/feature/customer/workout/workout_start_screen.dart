import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';
import 'package:gem_app2/video/you_tube_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutStartScreen extends StatelessWidget {
  final WorkOutModel item;

  const WorkoutStartScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            top: 0,
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                  initialVideoId: YouTube.getVideoId(
                      "https://www.youtube.com/watch?v=dRz991Yzouw")!,
                  flags: YouTube.getFlags(
                    startAt: TimeConverter.convertToSeconds(
                        time: item.workOutList[0].startTime),
                    endAt: TimeConverter.convertToSeconds(
                        time: item.workOutList[0].endTime),
                  )),
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
            top: context.deviceHeight * 0.055,
            child: Container(
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
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.deviceWidth,
              height: context.deviceHeight * 0.4,
              padding: EdgeInsets.all(25.r),
              decoration: const BoxDecoration(
                color: ColorsManager.darkgreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Secored Time",
                    style: TextStyleManager.textStyle18w400,
                    color: ColorsManager.lightGrayClr,
                  ),
                  CustomText(
                    text: "02:00",
                    style: TextStyle(
                      fontSize: 60.sp,
                    ),
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "Start",
                      color: ColorsManager.darkgreen,
                      style: TextStyleManager.textStyle18w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
