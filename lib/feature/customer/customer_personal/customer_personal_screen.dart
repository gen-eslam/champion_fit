import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_loading.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_personal/cubit/coustomer_personal_cubit.dart';
import 'package:gem_app2/feature/customer/customer_personal/widgets/personal_details_section.dart';
import 'package:gem_app2/feature/customer/customer_personal/widgets/personal_list_tile.dart';

class CustomerPersonalScreen extends StatelessWidget {
  const CustomerPersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoustomerPersonalCubit()..getUserData(),
      child: BlocBuilder<CoustomerPersonalCubit, CoustomerPersonalState>(
        builder: (context, state) {
          if (state is GetCustomerDataSuccess) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(20.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PersonalDetailsSection(userModel: state.userModel),
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
                                context.pushNamed(
                                    Routes.customerFeedBackRepliesScreen,
                                    arguments:
                                        CoustomerPersonalCubit.get(context)
                                            .userModel);
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
                          onPressed: () {
                            CacheService.clearData();
                            context.pushNamedAndRemoveUntil(
                              Routes.loginScreen,
                              predicate: (route) => false,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is GetCustomerDataError) {
            return Scaffold(
                body: Center(
              child: CustomText(
                text: state.errorMessage,
                style: TextStyleManager.textStyle18w600,
              ),
            ));
          } else {
            return const CustomLoading();
          }
        },
      ),
    );
  }

  Future<dynamic> customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
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
}
