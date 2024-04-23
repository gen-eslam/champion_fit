import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/trainer_and_manager/feedback/cubit/feadback_cubit.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeadbackCubit()..getFeadback(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Feedback Requests",
            style: TextStyleManager.textStyle30w700,
          ),
        ),
        body: BlocBuilder<FeadbackCubit, FeadbackState>(
          builder: (context, state) {
            if (state is FeadBackGetSuccess) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.pushReplacementNamed(Routes.feedBackRepliesScreen,
                          arguments: state.feadBacks[index]);
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
                          text: state.feadBacks[index]!.userName,
                          style: TextStyleManager.textStyle18w600,
                        ),
                        subtitle: CustomText(
                          maxLines: 1,
                          text: state.feadBacks[index]!.feadback!,
                          textOverflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyleManager.textStyle12w400,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.feadBacks.length,
              );
            } else if (state is FeadBackGetError) {
              return Center(
                child: CustomText(
                  text: "Error",
                  style: TextStyleManager.textStyle18w600,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.yellowClr,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
