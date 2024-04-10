import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_personal/widgets/personal_derails_section.dart';
import 'package:gem_app2/feature/customer/customer_personal/widgets/personal_list_tile.dart';

class CustomerPersonalScreen extends StatelessWidget {
  const CustomerPersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PersonalDetailsSection(),
                SizedBox(height: 50.h),
                CustomText(
                  text: "Account",
                  style: TextStyleManager.textStyle20w600,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.white,
                ),
                Column(
                  children: [
                    PersonalListTile(
                      leadingIcon: Icons.feed_outlined,
                      title: "Feedback",
                      onTap: () {
                        //context.pushNamed(Routes.customerFeedBackRepliesScreen);

                        feedbackShowDialog(context);
                      },
                    ),
                    PersonalListTile(
                      leadingIcon: Icons.pie_chart_outline,
                      title: "Activity History",
                      onTap: () {
                        // context.pushNamed(Routes.activityHistoryScreen);
                      },
                    ),
                    PersonalListTile(
                      leadingIcon: Icons.bookmark_border,
                      title: "Like",
                      onTap: () {
                        context.pushNamed(Routes.customerLikeScreen);
                      },
                    ),
                    PersonalListTile(
                      leadingIcon: Icons.card_membership_outlined,
                      title: "Membership",
                      onTap: () {
                        customBottomSheet(context);
                      },
                    ),
                    PersonalListTile(
                      leadingIcon: Icons.phone,
                      title: "Contact us",
                      onTap: () {
                        context.pushNamed(Routes.contactUsScreen);
                      },
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: ColorsManager.white,
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  color: ColorsManager.redClr,
                  child: CustomText(
                    text: "Logout",
                    style: TextStyleManager.textStyle18w600,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(20.r),
              height: context.deviceHeight * 0.3,
              color: ColorsManager.darkgreen,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: const NetworkImage(
                          "https://www.uab.edu/news/images/2018/Five_tips_Stream.jpg",
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "You’re subscribed in monthly membership",
                            style: TextStyleManager.textStyle15w700,
                          ),
                          CustomText(
                            text: "Renewal date: 10 August 2024",
                            style: TextStyleManager.textStyle12w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  PersonalListTile(
                    leadingIcon: Icons.card_membership_rounded,
                    title: "Change membership",
                    onTap: () {
                      // context.pushNamed(Routes.);
                    },
                  ),
                  PersonalListTile(
                    leadingIcon: Icons.card_membership_rounded,
                    title: "Cancel membership",
                    onTap: () {},
                  ),
                ],
              ));
        });
  }

  Future<dynamic> feedbackShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: context.deviceWidth * 0.8,
          height: context.deviceHeight * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: ColorsManager.darkgreen,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PersonalListTile(
                leadingIcon: Icons.feed_outlined,
                title: "Send a Feedback",
                onTap: () {
                  context.pop();
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            backgroundColor: ColorsManager.darkgreen,
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              constraints: BoxConstraints(
                                maxHeight: context.deviceHeight * 0.2,
                                minWidth: context.deviceWidth * 0.8,
                                maxWidth: context.deviceWidth * 0.8,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Write your feedback here",
                                        fillColor: ColorsManager.white,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      maxLines: 4,
                                      keyboardType: TextInputType.multiline,
                                    ),
                                  ),
                                  const Spacer(),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: CustomText(
                                      text: "Submit",
                                      color: ColorsManager.darkgreen,
                                      style: TextStyleManager.textStyle18w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
              ),
              PersonalListTile(
                leadingIcon: Icons.feed_outlined,
                title: "View your feedback replies",
                onTap: () {
                  context.pop();
                  context.pushNamed(Routes.customerFeedBackRepliesScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
