import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class WorkoutRepliesScreen extends StatelessWidget {
  const WorkoutRepliesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: StringManager.workoutReply,
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
              Container(
                padding: EdgeInsets.all(10.r),
                constraints: BoxConstraints(
                  minWidth: context.deviceWidth,
                  minHeight: context.deviceHeight * 0.4,
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
                        text: "Name",
                        textAlign: TextAlign.center,
                        style: TextStyleManager.textStyle18w600,
                      ),
                    ),
                    const Divider(
                      color: ColorsManager.yellowClr,
                      thickness: 2,
                    ),
                    CustomText(
                      text: "age",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text: "gender",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text: "height",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text: "weight",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text: "notes",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: ColorsManager.darkgreen,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: ColorsManager.white,
                  hintText: StringManager.reply,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: ColorsManager.darkgreen,
                            title: CustomText(
                              text: "send reply successfully",
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
                                  ))
                            ],
                          ));
                },
                icon: const Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}
