import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class CustomerFeedBackRepliesScreen extends StatelessWidget {
  const CustomerFeedBackRepliesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Feedback Replies",
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          // bottom: context.deviceHeight * 0.10,
          left: context.deviceWidth * 0.05,
          right: context.deviceWidth * 0.05,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10.r),
            constraints: BoxConstraints(
              minWidth: context.deviceWidth,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorsManager.white,
              border: Border.all(
                color: ColorsManager.yellowClr,
              ),
            ),
            child: CustomText(
              textAlign: TextAlign.start,
              text:
                  "NameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameN",
              style: TextStyleManager.textStyle18w600,
              color: Colors.black,
            ),
          ),
          separatorBuilder: (context, index) => AppSizedBox.h10,
          itemCount: 5,
        ),
      ),
    );
  }
}
