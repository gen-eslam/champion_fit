import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_home/model/diet_model.dart';

class FoodDetailsScreen extends StatelessWidget {
  final DietModel model;
  const FoodDetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: model.name!,
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: Container(
        width: context.deviceWidth,
        padding: EdgeInsets.all(
          25.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.network(
                model.image!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: AppPadding.p24,
            ),
            CustomText(
              text: "description",
              style: TextStyleManager.textStyle24w500,
            ),
            SizedBox(
              height: AppPadding.p24,
            ),
            CustomText(
              textAlign: TextAlign.start,
              text: model.description!,
              style: TextStyleManager.textStyle24w500,
            ),
          ],
        ),
      ),
    );
  }
}
