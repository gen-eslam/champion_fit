import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class ReportsAndInsightsScreen extends StatelessWidget {
  const ReportsAndInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Reports and Insights",
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.r,
          horizontal: 25.r,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ReportAndInsightsItem(text: "Total Memberships: 500"),
              AppSizedBox.h32,
              const ReportAndInsightsItem(text: "Total Trainers: 30"),
              AppSizedBox.h32,
              const ReportAndInsightsItem(text: r"Total Sales: 250000$"),
              AppSizedBox.h32,
              const ReportAndInsightsItem(text: "Active members: 200"),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportAndInsightsItem extends StatelessWidget {
  final String text;
  const ReportAndInsightsItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      constraints: BoxConstraints(
        minWidth: context.deviceWidth,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.darkgreen,
        border: Border.all(
          color: ColorsManager.yellowClr,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomText(
              text: text,
              textAlign: TextAlign.center,
              style: TextStyleManager.textStyle18w600,
            ),
          ),
        ],
      ),
    );
  }
}
