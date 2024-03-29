import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class FeadBackRepliesScreen extends StatelessWidget {
  const FeadBackRepliesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: StringManager.feedbackReplies,
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: context.deviceHeight * 0.10,
          left: context.deviceWidth * 0.05,
          right: context.deviceWidth * 0.05,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
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
                      "NameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNam",
                  style: TextStyleManager.textStyle18w600,
                  color: Colors.black,
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
