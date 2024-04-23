import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class BundleScreen extends StatefulWidget {
  const BundleScreen({super.key});

  @override
  State<BundleScreen> createState() => _BundleScreenState();
}

class _BundleScreenState extends State<BundleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 30.h,
              bottom: context.deviceHeight * 0.20),
          child: Column(
            children: [
              CustomText(
                text: StringManager.youWantToBecomeMember,
                style: TextStyleManager.textStyle32w700,
              ),
              CustomText(
                text: StringManager.checkOurSubscriptionsBelow,
                style: TextStyleManager.textStyle20w400,
              ),
              AppSizedBox.h48,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.paymentOptionsScreen,
                          arguments: 10);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: ColorsManager.white,
                          )),
                      child: Column(
                        children: [
                          CustomText(
                            text: r"10$",
                            style: TextStyleManager.textStyle36w700,
                          ),
                          CustomText(
                            text: "Monthly\n Bundle",
                            style: TextStyleManager.textStyle12w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.paymentOptionsScreen,
                          arguments: 20);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: ColorsManager.white,
                          )),
                      child: Column(
                        children: [
                          CustomText(
                            text: r"20$",
                            style: TextStyleManager.textStyle36w700,
                          ),
                          CustomText(
                            text: "Quarterly\n Bundle",
                            style: TextStyleManager.textStyle12w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.paymentOptionsScreen,
                          arguments: 50);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: ColorsManager.white,
                          )),
                      child: Column(
                        children: [
                          CustomText(
                            text: r"50$",
                            style: TextStyleManager.textStyle36w700,
                          ),
                          CustomText(
                            text: "Yearly\n Bundle",
                            style: TextStyleManager.textStyle12w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              // CustomElevatedButton(
              //     onPressed: () {
              //     },
              //     child: CustomText(
              //       text: StringManager.containue,
              //       style: TextStyleManager.textStyle20w400,
              //       color: ColorsManager.darkgreen,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
