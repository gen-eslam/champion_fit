import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/trainer_and_manager/manager/notify/notify_screen.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: context.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagesManager.logo,
              fit: BoxFit.contain, width: context.deviceWidth * 0.3),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  onPressed: () {
                    context.pushNamed(Routes.feedBackScreen);
                  },
                  child: CustomText(
                    text: StringManager.feedbacks,
                    style: TextStyleManager.textStyle32w700,
                    color: ColorsManager.darkgreen,
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    context.pushNamed(Routes.updatesScreen);
                  },
                  child: CustomText(
                    text: StringManager.updates,
                    style: TextStyleManager.textStyle32w700,
                    color: ColorsManager.darkgreen,
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    context.pushNamed(Routes.reportsAndInsightsScreen);
                  },
                  child: CustomText(
                    text: StringManager.reportsAndInsights,
                    style: TextStyleManager.textStyle32w700,
                    color: ColorsManager.darkgreen,
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotifiyScreen()),
                    );
                  },
                  child: CustomText(
                    text: "Send Notification",
                    style: TextStyleManager.textStyle32w700,
                    color: ColorsManager.darkgreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
