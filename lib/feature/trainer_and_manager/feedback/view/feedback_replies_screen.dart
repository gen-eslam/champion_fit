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
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_model.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_replay_model.dart';

class FeadBackRepliesScreen extends StatefulWidget {
  final FeadbacksModel model;
  const FeadBackRepliesScreen({
    super.key,
    required this.model,
  });

  @override
  State<FeadBackRepliesScreen> createState() => _FeadBackRepliesScreenState();
}

class _FeadBackRepliesScreenState extends State<FeadBackRepliesScreen> {
  TextEditingController textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.feedBackScreen);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: CustomText(
          text: StringManager.feedbackReplies,
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: context.deviceHeight * 0.10,
          left: context.deviceWidth * 0.05,
          right: context.deviceWidth * 0.05,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
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
                      text: "name : ${widget.model.userName}",
                      style: TextStyleManager.textStyle18w600,
                      color: Colors.black,
                    ),
                    CustomText(
                      textAlign: TextAlign.start,
                      text: "email : ${widget.model.email}",
                      style: TextStyleManager.textStyle18w600,
                      color: Colors.black,
                    ),
                    CustomText(
                      textAlign: TextAlign.start,
                      text: "message : ${widget.model.feadback}",
                      style: TextStyleManager.textStyle18w600,
                      color: Colors.black,
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
                        tableName: TablesName.feedBackReplies,
                        data: FeadBackReplayModel(
                                uid: widget.model.uid,
                                name: CacheService.getDataString(
                                    key: Keys.userName)!,
                                email:
                                    FirebaseAuth.instance.currentUser!.email!,
                                message: widget.model.feadback!,
                                replay: textController.text)
                            .toJson())
                    .then((value) {
                  FirebaseFireStoreService.deleteData(
                      tableName: TablesName.feadBack, id: widget.model.docId!);
                }).then((value) {
                  customShowDialog(context);
                });
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> customShowDialog(BuildContext context) {
    return showDialog(
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
                      context.pushReplacementNamed(Routes.feedBackScreen);
                    },
                    child: CustomText(
                      text: "ok",
                      style: TextStyleManager.textStyle18w400,
                    ))
              ],
            ));
  }
}
