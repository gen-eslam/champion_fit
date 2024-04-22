import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';

import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

import 'package:gem_app2/feature/customer/customer_home/widgets/search_and_notification_section.dart';
import 'package:gem_app2/feature/customer/customer_home/widgets/workout_and_diet_section.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.r,
      ),
      width: context.deviceWidth,
      child: Column(
        children: [
          const SearchAndNotificationSection(),
          AppSizedBox.h10,
          const Expanded(child: WorkoutAndDietSection()),
     
        ],
      ),
    );
  }
}
