import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/trainer_and_manager/workout/cubit/workout_requests_cubit.dart';

class WorkoutRequestsScreen extends StatelessWidget {
  const WorkoutRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutRequestsCubit()..getWorkoutRequests(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Workout Requests",
            style: TextStyleManager.textStyle30w700,
          ),
        ),
        body: BlocBuilder<WorkoutRequestsCubit, WorkoutRequestsState>(
          builder: (context, state) {
            if (state is WorkoutRequestsSuccess) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.pushReplacementNamed(Routes.workoutRepliesScreen,
                          arguments: state.customWorkoutModels[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorsManager.darkgreen,
                        border: Border.all(
                          color: ColorsManager.yellowClr,
                        ),
                      ),
                      child: ListTile(
                        title: CustomText(
                          textAlign: TextAlign.start,
                          text: state.customWorkoutModels[index].userName,
                          style: TextStyleManager.textStyle18w600,
                        ),
                        subtitle: CustomText(
                          textAlign: TextAlign.start,
                          text: state.customWorkoutModels[index].email,
                          style: TextStyleManager.textStyle15w400,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.customWorkoutModels.length,
              );
            } else if (state is WorkoutRequestsError) {
              return Center(
                child: CustomText(
                  text: state.message,
                  style: TextStyleManager.textStyle18w600,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
