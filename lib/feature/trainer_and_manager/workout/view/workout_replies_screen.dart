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
import 'package:gem_app2/feature/customer/customer_custom_workout_and_diet/model/coustom_workout_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/coustom_workout_replayes_model.dart';
import 'package:gem_app2/models/user_model.dart';

class WorkoutRepliesScreen extends StatefulWidget {
  final CustomWorkoutModel customWorkoutModel;
  const WorkoutRepliesScreen({super.key, required this.customWorkoutModel});

  @override
  State<WorkoutRepliesScreen> createState() => _WorkoutRepliesScreenState();
}

class _WorkoutRepliesScreenState extends State<WorkoutRepliesScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: StringManager.workoutReply,
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFireStoreService.getOneData<UserModel>(
            tableName: TablesName.users,
            pram: "uid",
            pramValue: widget.customWorkoutModel.uid,
            fromJson: UserModel.fromJson,
          ),
          builder: (context, snapshot) {
            return Container(
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
                              text: "Name ${snapshot.data?.userName}",
                              textAlign: TextAlign.center,
                              style: TextStyleManager.textStyle18w600,
                            ),
                          ),
                          const Divider(
                            color: ColorsManager.yellowClr,
                            thickness: 2,
                          ),
                          CustomText(
                            text: "age: ${snapshot.data?.age}",
                            textAlign: TextAlign.start,
                            style: TextStyleManager.textStyle18w600,
                          ),
                          CustomText(
                            text:
                                "gender: ${snapshot.data?.isFemale == true ? "Female" : "Male"}",
                            textAlign: TextAlign.start,
                            style: TextStyleManager.textStyle18w600,
                          ),
                          CustomText(
                            text: "height: ${snapshot.data?.height}",
                            textAlign: TextAlign.start,
                            style: TextStyleManager.textStyle18w600,
                          ),
                          CustomText(
                            text: "weight: ${snapshot.data?.weight}",
                            textAlign: TextAlign.start,
                            style: TextStyleManager.textStyle18w600,
                          ),
                          CustomText(
                            text:
                                "notes: \n ${widget.customWorkoutModel.workoutNote}",
                            textAlign: TextAlign.start,
                            style: TextStyleManager.textStyle18w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      bottomSheet: Container(
        color: ColorsManager.darkgreen,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: null,
                controller: textController,
                keyboardType: TextInputType.multiline,
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
                  tableName: TablesName.customWorkoutsReplies,
                  data: CustomWorkoutRepliesModel(
                    reply: textController.text,
                    trainerEmail: FirebaseAuth.instance.currentUser!.email,
                    message: widget.customWorkoutModel.workoutNote,
                    trainerName: CacheService.getDataString(key: Keys.userName),
                    trainerUid: CacheService.getDataString(key: Keys.userId),
                    customerUid: widget.customWorkoutModel.uid,
                  ).toJson(),
                ).then((value) {
                  textController.clear();
                  FirebaseFireStoreService.deleteData(
                    tableName: TablesName.customWorkouts,
                    id: widget.customWorkoutModel.docId!,
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
                                Routes.workoutRepliesScreen,
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
              icon: const Icon(
                Icons.send,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
