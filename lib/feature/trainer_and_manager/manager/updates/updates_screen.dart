import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/payment/model/payment_model.dart';
import 'package:gem_app2/feature/trainer_and_manager/manager/updates/cubit/updates_cubit.dart';
import 'package:gem_app2/models/user_model.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller;
    controller = ScrollController();
    return BlocProvider(
      create: (context) => UpdatesCubit()..getAllUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "updates",
            style: TextStyleManager.textStyle30w700,
          ),
        ),
        body: BlocBuilder<UpdatesCubit, UpdatesState>(
          builder: (context, state) {
            if (state is GetAllUserSucess) {
              return ListView.separated(
                itemCount: state.userModel.length,
                controller: controller, //new line
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return UpdatesItem(
                    userModel: state.userModel[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return AppSizedBox.h24;
                },
              );
            } else if (state is GetAllUserError) {
              return Center(
                child: CustomText(
                  text: state.error,
                  style: TextStyleManager.textStyle18w400,
                ),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.yellowClr,
              ));
            }
          },
        ),
      ),
    );
  }
}

class UpdatesItem extends StatelessWidget {
  final PaymentModel? userModel;
  const UpdatesItem({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.darkgreen,
        border: Border.all(
          color: ColorsManager.yellowClr,
        ),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: userModel!.name!,
              textAlign: TextAlign.start,
              style: TextStyleManager.textStyle15w500,
            ),
          ],
        ),
        subtitle: CustomText(
          textAlign: TextAlign.start,
          text: userModel!.price! == "0"
              ? " canceled his subscription"
              : " paid for his subscription ${userModel!.price!.toString()}",
          style: TextStyleManager.textStyle15w500,
        ),
      ),
    );
  }
}
