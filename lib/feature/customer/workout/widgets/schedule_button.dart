import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/services/time_format_services.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/workout/model/workout_model.dart';
import 'package:gem_app2/feature/customer/workout_schedule/model/workout_schedule_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ScheduleButton extends StatelessWidget {
  final WorkoutModel item;

  const ScheduleButton({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showOmniDateTimePicker(
          barrierDismissible: true,
          theme: ThemeData(
            useMaterial3: false,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.darkgreen,
              ),
            ),
          ),
          context: context,
        ).then((value) {
          FirebaseFireStoreService.addData(
            tableName: TablesName.schedule,
            data: WorkOutScheduleModel(
              date: TimeFormatServices.timeFormatyDayFullDateAndTime(value!),
              uid: CacheService.getDataString(key: Keys.userId),
              workoutModel: item,
            ).toJson(),
          );
        });
      },
      child: Container(
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
              FittedBox(
                child: CustomText(
                  text: TimeFormatServices.timeFormatDayMonthAndTime(
                      DateTime.now()),
                  style: TextStyleManager.textStyle14w600,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: ColorsManager.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
