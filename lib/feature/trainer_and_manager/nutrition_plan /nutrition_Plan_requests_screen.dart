import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/trainer_and_manager/nutrition_plan%E2%80%A8/cubit/nutrition_plan_requests_cubit.dart';

class NutritionPlanRequestsScreen extends StatelessWidget {
  const NutritionPlanRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NutritionPlanRequestsCubit()..getNutritionRequests(),
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(
            child: CustomText(
              text: "Nutrition Plan Requests",
              style: TextStyleManager.textStyle18w600,
            ),
          ),
        ),
        body:
            BlocBuilder<NutritionPlanRequestsCubit, NutritionPlanRequestsState>(
          builder: (context, state) {
            if (state is NutritionPlanRequestsSucess) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.pushReplacementNamed(Routes.nutritionRepliesScreen,arguments:state.customDietModel[index] );
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
                          text: state.customDietModel[index]!.userName,
                          style: TextStyleManager.textStyle18w600,
                        ),
                        subtitle: CustomText(
                          textAlign: TextAlign.start,
                          text: state.customDietModel[index]!.email,
                          style: TextStyleManager.textStyle18w600,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.customDietModel.length,
              );
            } else if (state is NutritionPlanRequestsError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child:
                    CircularProgressIndicator(color: ColorsManager.yellowClr),
              );
            }
          },
        ),
      ),
    );
  }
}
