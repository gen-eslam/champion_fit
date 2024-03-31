import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/icon_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/logic/customer_home_layout_cubit.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomerHomeLayoutBottomNavBar extends StatelessWidget {
  const CustomerHomeLayoutBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerHomeLayoutCubit, CustomerHomeLayoutState>(
      builder: (context, state) {
        return SalomonBottomBar(
            currentIndex: CustomerHomeLayoutCubit.get(context).currentIndex,
            onTap: (value) {
              CustomerHomeLayoutCubit.get(context)
                  .changePageOnTab(index: value);
            },
            items: [
              SalomonBottomBarItem(
                icon: SvgPicture.asset(IconManager.home, width: 24.r),
                activeIcon: SvgPicture.asset(
                  IconManager.home,
                  width: 24.r,
                  color: ColorsManager.yellowClr,
                ),
                title: CustomText(
                  text: StringManager.home,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(IconManager.activity, width: 24.r),
                activeIcon: SvgPicture.asset(
                  IconManager.activity,
                  width: 24.r,
                  color: ColorsManager.yellowClr,
                ),
                title: CustomText(
                  text: StringManager.activity,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(IconManager.calender, width: 24.r),
                activeIcon: SvgPicture.asset(
                  IconManager.calender,
                  width: 24.r,
                  color: ColorsManager.yellowClr,
                ),
                title: CustomText(
                  text: StringManager.calender,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(IconManager.profile, width: 24.r),
                activeIcon: SvgPicture.asset(
                  IconManager.profile,
                  width: 24.r,
                  color: ColorsManager.yellowClr,
                ),
                title: CustomText(
                  text: StringManager.profile,
                  style: TextStyleManager.textStyle15w500,
                ),
              ),
            ]);
      },
    );
  }
}
