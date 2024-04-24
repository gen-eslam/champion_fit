import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_loading.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/custom_diet_replies/cubit/diet_replies_cubit.dart';
import 'package:gem_app2/feature/customer/custom_workout_replies/cubit/workout_replies_cubit.dart';
import 'package:gem_app2/models/coustom_diet_replayes_model.dart';
import 'package:gem_app2/models/coustom_workout_replayes_model.dart';

class CustomerWorkOutRepliesScreen extends StatelessWidget {
  const CustomerWorkOutRepliesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutRepliesCubit()..getReplies(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Custom Workout Replies",
            style: TextStyleManager.textStyle18w600,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: context.deviceWidth * 0.05,
            right: context.deviceWidth * 0.05,
          ),
          child: BlocBuilder<WorkoutRepliesCubit, WorkoutRepliesState>(
            builder: (context, state) {
              if (state is WorkoutRepliesGetSuccess) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      WorkoutReplaysItem(model: state.feadBacks[index]!),
                  separatorBuilder: (context, index) => AppSizedBox.h10,
                  itemCount: state.feadBacks.length,
                );
              } else if (state is WorkoutRepliesGetError) {
                return Center(
                  child: CustomText(
                    text: state.error,
                    style: TextStyleManager.textStyle18w600,
                  ),
                );
              } else {
                return const CustomLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}

class WorkoutReplaysItem extends StatelessWidget {
  final CustomWorkoutRepliesModel model;
  const WorkoutReplaysItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      constraints: BoxConstraints(
        minWidth: context.deviceWidth,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.white,
        border: Border.all(
          color: ColorsManager.yellowClr,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            textAlign: TextAlign.start,
            text: model.trainerName!,
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: model.trainerEmail!,
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text:
                "message:\n ${model.message!.isEmpty ? "Empty" : model.message!}",
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: "reply:\n ${model.reply!.isEmpty ? "Empty" : model.reply!}",
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
