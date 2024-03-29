import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Feedback Requests",
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.pushNamed(Routes.feedBackRepliesScreen);
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
                  subtitle: CustomText(
                    text: "Feedback all my friends are toxic",
                    textAlign: TextAlign.start,
                    style: TextStyleManager.textStyle14w600,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 60),
    );
  }
}
