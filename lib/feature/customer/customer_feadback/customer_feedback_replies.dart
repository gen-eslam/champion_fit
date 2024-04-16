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
import 'package:gem_app2/core/widgets/custom_snak_bar.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_feadback/cubit/fead_back_cubit.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_model.dart';
import 'package:gem_app2/models/user_model.dart';

class CustomerFeedBackRepliesScreen extends StatelessWidget {
  final UserModel user;

  const CustomerFeedBackRepliesScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Feedback Replies",
          style: TextStyleManager.textStyle18w600,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        backgroundColor: ColorsManager.darkgreen,
                        child: BlocConsumer<FeadBackCubit, FeadBackState>(
                          listener: (context, state) {
                            if (state is FeadBackSendSuccess) {
                              FeadBackCubit.get(context)
                                  .feadBackController
                                  .clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                  text: "Send Success",
                                  colorState: ColorState.sucess,
                                ),
                              );
                              context.pop();
                            }
                          },
                          builder: (context, state) {
                            if (state is FeadBackSendLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: ColorsManager.yellowClr,
                                ),
                              );
                            } else {
                              return Container(
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
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: TextField(
                                        controller: FeadBackCubit.get(context)
                                            .feadBackController,
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
                                        FeadBackCubit.get(context).sendFeadBack(
                                          FeadbacksModel(
                                            userName: user.userName!,
                                            feadback: FeadBackCubit.get(context)
                                                .feadBackController
                                                .text,
                                            email: user.email!,
                                            uid: CacheService.getDataString(
                                              key: Keys.userId,
                                            )!,
                                          ),
                                        );
                                      },
                                      child: CustomText(
                                        text: "Submit",
                                        color: ColorsManager.darkgreen,
                                        style: TextStyleManager.textStyle18w600,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ));
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          // bottom: context.deviceHeight * 0.10,
          left: context.deviceWidth * 0.05,
          right: context.deviceWidth * 0.05,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
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
            child: CustomText(
              textAlign: TextAlign.start,
              text:
                  "NameNameNammeNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameNameN",
              style: TextStyleManager.textStyle18w600,
              color: Colors.black,
            ),
          ),
          separatorBuilder: (context, index) => AppSizedBox.h10,
          itemCount: 5,
        ),
      ),
    );
  }
}
