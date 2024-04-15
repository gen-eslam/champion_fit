import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_snak_bar.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/logic/customer_home_layout_cubit.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';
import 'package:image_picker/image_picker.dart';

final scaffoldState = GlobalKey<ScaffoldState>();

class ProfilePhotoScreen extends StatelessWidget {
  const ProfilePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 30.h,
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              CustomText(
                text: StringManager.enterYourPhotoHere,
                style: TextStyleManager.textStyle32w700,
              ),
              AppSizedBox.h16,
              CustomText(
                text: StringManager.wantAPhotoForProfilePhotoPurposes,
                style: TextStyleManager.textStyle20w400,
              ),
              AppSizedBox.h24,
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  scaffoldState.currentState!.showBottomSheet(
                    elevation: 20,
                    enableDrag: true,
                    backgroundColor: ColorsManager.darkgreen,
                    (context) => customBottomSheet(context),
                  );
                },
                child: Stack(
                  children: [
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          backgroundImage:
                              RegisterCubit.get(context).image != null
                                  ? FileImage(
                                      RegisterCubit.get(context).image!,
                                    )
                                  : null,
                          radius: context.deviceWidth * 0.17,
                          child: RegisterCubit.get(context).image == null
                              ? CustomText(
                                  text: "Click Here",
                                  style: TextStyleManager.textStyle18w600,
                                )
                              : null,
                        );
                      },
                    ),
                    const Positioned(
                      bottom: 5,
                      right: 5,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: ColorsManager.darkgreen,
                        child: CircleAvatar(
                          backgroundColor: ColorsManager.yellowClr,
                          radius: 15,
                          child: CircleAvatar(
                            backgroundColor: ColorsManager.white,
                            radius: 7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return state is UpdateUserModelLoading
                      ? const CircularProgressIndicator(
                          color: ColorsManager.yellowClr,
                        )
                      : CustomElevatedButton(
                          onPressed: () async {
                            if (RegisterCubit.get(context).image != null) {
                              await RegisterCubit.get(context)
                                  .uploadImage()
                                  .then((value) {
                                RegisterCubit.get(context)
                                    .addDataUserToFirebase()
                                    .then((value) {
                                  RegisterCubit.get(context).clearData();
                                  CustomerHomeLayoutCubit.get(context)
                                      .currentIndex = 0;
                                  context.pushNamedAndRemoveUntil(
                                    Routes.customerHomeLayoutScreen,
                                    predicate: (val) => false,
                                  );
                                });
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(
                                  text: "Please Choose A Photo",
                                  colorState: ColorState.failure,
                                ),
                              );
                            }
                          },
                          child: CustomText(
                            text: StringManager.saveChanges,
                            style: TextStyleManager.textStyle20w400,
                            color: ColorsManager.darkgreen,
                          ),
                        );
                },
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customBottomSheet(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      height: context.deviceHeight * 0.20,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ), // changes position of shadow
        ],
        color: ColorsManager.darkgreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: "Profile Pictures",
                style: TextStyleManager.textStyle30w700),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    RegisterCubit.get(context)
                        .pickImage(source: ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(
                        bottom: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                        top: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                      ),
                      color: ColorsManager.darkgreen,
                    ),
                    width: 60,
                    height: 60,
                    child: const Icon(
                      Icons.camera_alt,
                      color: ColorsManager.yellowClr,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppPadding.p16,
                ),
                InkWell(
                  onTap: () {
                    RegisterCubit.get(context)
                        .pickImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(
                        bottom: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                        top: BorderSide(
                          color: ColorsManager.yellowClr,
                          width: 2,
                        ),
                      ),
                      color: ColorsManager.darkgreen,
                    ),
                    width: 60,
                    height: 60,
                    child: const Icon(
                      Icons.image,
                      color: ColorsManager.yellowClr,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
