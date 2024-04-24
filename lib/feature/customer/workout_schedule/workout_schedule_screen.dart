import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/workout_schedule/cubit/workout_schedule_cubit.dart';
import 'package:gem_app2/feature/customer/workout_schedule/model/workout_schedule_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';

class WorkoutScheduleScreen extends StatelessWidget {
  const WorkoutScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutScheduleCubit()..getWorkoutSchedule(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                AppSizedBox.h10,
                CustomText(
                  text: " Workout Schedule",
                  style: TextStyleManager.textStyle24w700,
                ),
                AppSizedBox.h10,
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                    text: "Upcoming Workout",
                    style: TextStyleManager.textStyle18w400,
                  ),
                ),
                AppSizedBox.h10,
                Expanded(
                  child:
                      BlocBuilder<WorkoutScheduleCubit, WorkoutScheduleState>(
                    builder: (context, state) {
                      if (state is WorkoutScheduleSuccess) {
                        return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListViewItem(
                                item: state.workOutScheduleModel[index]!,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: state.workOutScheduleModel.length);
                      } else if (state is WorkoutScheduleError) {
                        return Center(
                            child: CustomText(
                          text: state.error,
                          style: TextStyleManager.textStyle15w700,
                        ));
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: ColorsManager.yellowClr,
                        ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  final WorkOutScheduleModel item;
  const ListViewItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.workoutScreen, arguments: item.workoutModel);
      },
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: context.deviceWidth,
            height: 200.h,
            decoration: BoxDecoration(
              color: ColorsManager.grayClr,
              image: DecorationImage(
                image: NetworkImage(
                  item.workoutModel!.imageUrl!,
                  // scale: 1 / 1,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
              onTap: () {
                FirebaseFireStoreService.deleteData(
                        tableName: TablesName.schedule, id: item.docId!)
                    .then((value) {
                  WorkoutScheduleCubit.get(context).getWorkoutSchedule();
                });
              },
              child: Container(
                padding: EdgeInsets.all(1.r),
                decoration: BoxDecoration(
                  color: ColorsManager.grayClr.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.delete,
                  color: ColorsManager.yellowClr,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              constraints: BoxConstraints(maxWidth: context.deviceWidth * 0.8),
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                color: ColorsManager.grayClr.withOpacity(0.7),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.r,
                    ),
                    height: 15.r,
                    width: 1,
                    color: ColorsManager.yellowClr,
                  ),
                  Expanded(
                    child: CustomText(
                      textAlign: TextAlign.start,
                      text: "${item.workoutModel!.title} - ${item.date} ",
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      style: TextStyleManager.textStyle12w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
