import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_personal/widgets/details_container.dart';
import 'package:gem_app2/models/user_model.dart';

class PersonalDetailsSection extends StatelessWidget {
  final UserModel userModel;
  const PersonalDetailsSection({
    super.key,
    required this.userModel,
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
              backgroundImage: NetworkImage(
                userModel.imageUrl!,
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: userModel.userName!,
                  style: TextStyleManager.textStyle20w600,
                ),
                CustomText(
                  text: userModel.email!,
                  style: TextStyleManager.textStyle15w700,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailsContainer(
              title: "Height",
              value: "${userModel.height} cm",
            ),
            DetailsContainer(
              title: "Weight",
              value: "${userModel.weight} kg",
            ),
            DetailsContainer(
              title: "Age",
              value: "${userModel.age} yo",
            ),
          ],
        ),
      ],
    );
  }
}
