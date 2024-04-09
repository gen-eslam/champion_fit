import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_personal/widgets/details_container.dart';

class PersonalDetailsSection extends StatelessWidget {
  const PersonalDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundImage: const NetworkImage(
                "https://www.uab.edu/news/images/2018/Five_tips_Stream.jpg",
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Personal",
                  style: TextStyleManager.textStyle20w600,
                ),
                CustomText(
                  text: "gen@gmail.com",
                  style: TextStyleManager.textStyle15w700,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailsContainer(),
            DetailsContainer(),
            DetailsContainer(),
          ],
        ),
      ],
    );
  }
}
