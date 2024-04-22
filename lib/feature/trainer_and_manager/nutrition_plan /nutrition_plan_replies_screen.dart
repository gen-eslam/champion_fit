import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_custom_workout_and_diet/model/custom_diet_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/coustom_diet_replayes_model.dart';
import 'package:gem_app2/models/user_model.dart';

class NutritionRepliesScreen extends StatefulWidget {
  final CustomDietModel customDietModel;
  const NutritionRepliesScreen({super.key, required this.customDietModel});

  @override
  State<NutritionRepliesScreen> createState() => _NutritionRepliesScreenState();
}

class _NutritionRepliesScreenState extends State<NutritionRepliesScreen> {
  UserModel? userModel;
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    FirebaseFireStoreService.getOneData<UserModel>(
      tableName: TablesName.users,
      pram: "uid",
      pramValue: widget.customDietModel.uid,
      fromJson: UserModel.fromJson,
    ).then((value) => userModel = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: StringManager.nutritionPlanReply,
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
              Container(
                padding: EdgeInsets.all(10.r),
                constraints: BoxConstraints(
                  minWidth: context.deviceWidth,
                  minHeight: context.deviceHeight * 0.4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorsManager.darkgreen,
                  border: Border.all(
                    color: ColorsManager.yellowClr,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomText(
                        text: "Name ${userModel!.userName}",
                        textAlign: TextAlign.center,
                        style: TextStyleManager.textStyle18w600,
                      ),
                    ),
                    const Divider(
                      color: ColorsManager.yellowClr,
                      thickness: 2,
                    ),
                    CustomText(
                      text: "age: ${userModel!.age}",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text:
                          "gender: ${userModel!.isFemale == true ? "Female" : "Male"}",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text: "height: ${userModel!.height}",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text: "weight: ${userModel!.weight}",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    CustomText(
                      text: "notes: \n ${widget.customDietModel.dietNote}",
                      textAlign: TextAlign.start,
                      style: TextStyleManager.textStyle18w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: ColorsManager.darkgreen,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: textController,
                decoration: const InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: ColorsManager.white,
                  hintText: StringManager.reply,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  FirebaseFireStoreService.addData(
                    tableName: TablesName.customDitesReplies,
                    data: CustomDietRepliesModel(
                      reply: textController.text,
                      trainerEmail: FirebaseAuth.instance.currentUser!.email,
                      message: widget.customDietModel.dietNote,
                      trainerName:
                          CacheService.getDataString(key: Keys.userName),
                      trainerUid: CacheService.getDataString(key: Keys.userId),
                      customerUid: widget.customDietModel.uid,
                    ).toJson(),
                  ).then((value) {
                    textController.clear();
                    FirebaseFireStoreService.deleteData(
                      tableName: TablesName.customDites,
                      id: widget.customDietModel.docId!,
                    );
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: ColorsManager.darkgreen,
                        title: CustomText(
                          text: "send reply successfully",
                          style: TextStyleManager.textStyle18w400,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context.pop();
                                context.pushReplacementNamed(
                                  Routes.nutritionPlanRequestsScreen,
                                );
                              },
                              child: CustomText(
                                text: "ok",
                                style: TextStyleManager.textStyle18w400,
                              ))
                        ],
                      ),
                    );
                  });
                },
                icon: const Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}
