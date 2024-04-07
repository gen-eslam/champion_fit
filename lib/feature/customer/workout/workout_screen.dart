import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/icon_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

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
              "https://images.ctfassets.net/90pc6zknij8o/6kOrrUlbFu9IXAiFmtrLLA/359dc29aba15362528d3d0e4331c4244/Fitness_Male_Push-Up_Claudius_002-e1544444635307.jpg?w=900&h=591&q=50&fm=webp&fit=fill&f=faces",
              height: context.deviceHeight * 0.35,
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
                    text: "Push Up",
                    style: TextStyleManager.textStyle25w700,
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
