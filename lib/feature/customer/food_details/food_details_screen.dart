import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Food Details",
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: Container(
        width: context.deviceWidth,
        padding: EdgeInsets.symmetric(
          horizontal: 10.r,
        ),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.network(
                "https://www.uab.edu/news/images/2018/Five_tips_Stream.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "$index-",
                        style: TextStyleManager.textStyle18w600,
                      ),
                      AppSizedBox.h10,
                      CustomText(
                        text: "Scrambled eggs.",
                        style: TextStyleManager.textStyle18w600,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return AppSizedBox.h10;
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
