import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class SearchAndNotificationSection extends StatelessWidget {
  const SearchAndNotificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                context.pushNamed(Routes.searchScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.grayClr,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 40.r,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    CustomText(
                      text: "Search",
                      style: TextStyleManager.textStyle20w400,
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
              padding: EdgeInsets.zero,
              iconSize: 40.r,
              onPressed: () {
                context.pushNamed(Routes.notificationScreen);
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
