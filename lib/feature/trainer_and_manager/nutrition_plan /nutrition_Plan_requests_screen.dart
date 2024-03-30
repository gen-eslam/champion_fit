import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class NutritionPlanRequestsScreen extends StatelessWidget {
  const NutritionPlanRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: CustomText(
            text: "Nutrition Plan Requests",
            style: TextStyleManager.textStyle30w700,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(Routes.nutritionRepliesScreen);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsManager.darkgreen,
                border: Border.all(
                  color: ColorsManager.yellowClr,
                ),
              ),
              child: ListTile(
                title: CustomText(
                  textAlign: TextAlign.start,
                  text: "Name",
                  style: TextStyleManager.textStyle18w600,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 60,
      ),
    );
  }
}
