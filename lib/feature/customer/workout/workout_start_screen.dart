import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class WorkoutStartScreen extends StatelessWidget {
  const WorkoutStartScreen({super.key});

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
            child: Image.network(
              "https://images.ctfassets.net/90pc6zknij8o/6kOrrUlbFu9IXAiFmtrLLA/359dc29aba15362528d3d0e4331c4244/Fitness_Male_Push-Up_Claudius_002-e1544444635307.jpg?w=900&h=591&q=50&fm=webp&fit=fill&f=faces",
              height: context.deviceHeight * 0.60,
              width: context.deviceWidth,
              fit: BoxFit.cover,
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
                    color: ColorsManager.grayClr,
                  ),
                  CustomText(
                    text: "02:00",
                    style: TextStyleManager.textStyle20w600,
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
