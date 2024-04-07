import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class CustomWorkoutScreen extends StatelessWidget {
  const CustomWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: StringManager.customPlan,
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: context.deviceHeight * 0.10,
          left: context.deviceWidth * 0.10,
          right: context.deviceWidth * 0.10,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomText(
                textAlign: TextAlign.start,
                text:
                    "For custom plan, first we would like to send your profile information first to one of our trainers and he will send bak your custom plan in mail.",
                style: TextStyleManager.textStyle18w600,
                color: ColorsManager.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              const TextField(
                maxLines: null,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: ColorsManager.white,
                  hintText: StringManager.ifYouWantToAddNotesTypeItHere,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomElevatedButton(
                child: CustomText(
                  text: StringManager.accept,
                  style: TextStyleManager.textStyle24w500,
                  color: ColorsManager.darkgreen,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      
                      backgroundColor: ColorsManager.darkgreen,
                      title: CustomText(
                        text:
                            "Your profile information has been sent successfully to one of our trainers and he will send your workout ASAP on mail, thank you.",
                        style: TextStyleManager.textStyle18w400,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                            context.pop();
                          },
                          child: CustomText(
                            text: "ok",
                            style: TextStyleManager.textStyle18w400,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
