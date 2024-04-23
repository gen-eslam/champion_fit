import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/fake_data.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';

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
            child: CustomText(
                text: "Champions",
                style: TextStyleManager.textStyle18w600
                    .copyWith(color: ColorsManager.white)),
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
