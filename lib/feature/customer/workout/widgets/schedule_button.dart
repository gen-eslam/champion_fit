
import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class ScheduleButton extends StatelessWidget {
  const ScheduleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsManager.grayClr,
      ),
      child: ListTile(
        leading: const Icon(
          Icons.calendar_month_outlined,
          color: ColorsManager.white,
        ),
        title: CustomText(
          textAlign: TextAlign.start,
          text: "Schedule Workout",
          style: TextStyleManager.textStyle18w400,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "3/5 09:30",
              style: TextStyleManager.textStyle14w600,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.white,
            ),
          ],
        ),
      ),
    );
  }
}
