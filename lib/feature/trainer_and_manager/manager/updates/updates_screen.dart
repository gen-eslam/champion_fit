import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "updates",
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return const UpdatesItem(text: "text");
        },
        separatorBuilder: (context, index) {
          return AppSizedBox.h24;
        },
        itemCount: 20,
      ),
    );
  }
}

class UpdatesItem extends StatelessWidget {
  final String text;
  const UpdatesItem({
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
