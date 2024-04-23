import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_loading.dart';
import 'package:gem_app2/core/widgets/custom_snak_bar.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_feadback/cubit/fead_back_cubit.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_model.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_replay_model.dart';
import 'package:gem_app2/models/user_model.dart';

class CustomerFeedBackRepliesScreen extends StatelessWidget {
  final UserModel user;

  const CustomerFeedBackRepliesScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeadBackCubit()..getFeadBack(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Feedback Replies",
            style: TextStyleManager.textStyle18w600,
          ),
          actions: [
            IconButton(
              onPressed: () {
                customShowDialog(
                  context,
                );
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: context.deviceWidth * 0.05,
            right: context.deviceWidth * 0.05,
          ),
          child: BlocBuilder<FeadBackCubit, FeadBackState>(
            builder: (context, state) {
              if (state is FeadBackGetSuccess) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      FeadBackReplaysItem(model: state.feadBacks[index]!),
                  separatorBuilder: (context, index) => AppSizedBox.h10,
                  itemCount: state.feadBacks.length,
                );
              } else if (state is FeadBackGetError) {
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

  Future<dynamic> customShowDialog(
    BuildContext context,
  ) {
    TextEditingController textController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: ColorsManager.darkgreen,
              child: Container(
                padding: EdgeInsets.all(10.r),
                constraints: BoxConstraints(
                  maxHeight: context.deviceHeight * 0.2,
                  minWidth: context.deviceWidth * 0.8,
                  maxWidth: context.deviceWidth * 0.8,
                ),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Write your feedback here",
                          fillColor: ColorsManager.white,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                        ),
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                      onPressed: () {
                        try {
                          FirebaseFireStoreService.addData(
                            tableName: TablesName.feadBack,
                            data: FeadbacksModel(
                              userName: user.userName!,
                              feadback: textController.text,
                              email: user.email!,
                              uid: CacheService.getDataString(
                                key: Keys.userId,
                              )!,
                            ).toJson(),
                          ).then((value) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                    text: "Your feedback has been submitted",
                                    colorState: ColorState.sucess));
                          });
                        } catch (e) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(customSnackBar(
                            text: e.toString(),
                            colorState: ColorState.failure,
                          ));
                        }
                      },
                      child: CustomText(
                        text: "Submit",
                        color: ColorsManager.darkgreen,
                        style: TextStyleManager.textStyle18w600,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class FeadBackReplaysItem extends StatelessWidget {
  final FeadBackReplayModel model;
  const FeadBackReplaysItem({
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
            text: model.email,
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: model.replay.isEmpty ? "Empty" : model.replay,
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: model.replay.isEmpty ? "Empty" : model.replay,
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
          CustomText(
            textAlign: TextAlign.start,
            text: model.replay.isEmpty ? "Empty" : model.replay,
            style: TextStyleManager.textStyle18w600,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
