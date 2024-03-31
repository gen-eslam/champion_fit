import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: StringManager.notifications,
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.r),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const FlutterLogo(
              size: 40,
            ),
            title: CustomText(
              textAlign: TextAlign.start,
              text: "title",
              style: TextStyleManager.textStyle18w600,
            ),
            subtitle: CustomText(
              textAlign: TextAlign.start,
              text: "subtitle",
              color: Colors.grey,
              style: TextStyleManager.textStyle15w400,
            ),
          );
        },
        itemCount: 20,
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            color: ColorsManager.darkBlueShadeClr,
            indent: 25,
            endIndent: 25,
          );
        },
      ),
    );
  }
}
