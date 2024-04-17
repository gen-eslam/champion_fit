import 'package:flutter/cupertino.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class TrainerHomeScreen extends StatelessWidget {
  const TrainerHomeScreen({super.key});

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
                    context.pushNamed(Routes.workoutRequestsScreen);
                  },
                  child: CustomText(
                    text: StringManager.customWorkoutsRequests,
                    style: TextStyleManager.textStyle32w700,
                    color: ColorsManager.darkgreen,
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    context.pushNamed(Routes.nutritionPlanRequestsScreen);
                  },
                  child: CustomText(
                    text: StringManager.customNutritionPlanRequests,
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
