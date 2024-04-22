import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_snak_bar.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_custom_workout_and_diet/model/custom_diet_model.dart';
import 'package:gem_app2/feature/customer/customer_home/model/diet_model.dart';
import 'package:gem_app2/firebase/firebase_auth_service.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';

class CustomDietScreen extends StatefulWidget {
  const CustomDietScreen({super.key});

  @override
  State<CustomDietScreen> createState() => _CustomDietScreenState();
}

class _CustomDietScreenState extends State<CustomDietScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Custom Plan",
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: context.deviceHeight * 0.10,
          left: context.deviceWidth * 0.10,
          right: context.deviceWidth * 0.10,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomText(
                textAlign: TextAlign.start,
                text:
                    "For custom workouts, first we would like to send your profile information first to one of our trainers and he will send bak your custom Plan .",
                style: TextStyleManager.textStyle18w600,
                color: ColorsManager.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                maxLines: null,
                minLines: 5,
                controller: textController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: ColorsManager.white,
                  hintText: StringManager.ifYouWantToAddNotesTypeItHere,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomElevatedButton(
                child: CustomText(
                  text: StringManager.accept,
                  style: TextStyleManager.textStyle24w500,
                  color: ColorsManager.darkgreen,
                ),
                onPressed: () {
                  try {
                    FirebaseFireStoreService.addData(
                      tableName: TablesName.customDites,
                      data: CustomDietModel(
                        userName:
                            CacheService.getDataString(key: Keys.userName)!,
                        dietNote: textController.text,
                        email: FirebaseAuth.instance.currentUser!.email!,
                        uid: CacheService.getDataString(
                          key: Keys.userId,
                        )!,
                      ).toJson(),
                    ).then((value) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          text:
                              "Your profile information has been sent successfully to one of our trainers and he will send your workout ASAP on mail, thank you.",
                          colorState: ColorState.sucess,
                        ),
                      );
                    });
                  } catch (e) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                      text: e.toString(),
                      colorState: ColorState.failure,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
