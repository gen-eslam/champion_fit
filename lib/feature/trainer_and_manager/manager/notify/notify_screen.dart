import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_snak_bar.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/notification/fcm_notification.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';

class NotifiyScreen extends StatefulWidget {
  const NotifiyScreen({super.key});

  @override
  State<NotifiyScreen> createState() => _NotifiyScreenState();
}

class _NotifiyScreenState extends State<NotifiyScreen> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Notifications",
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            const Spacer(),
            TextField(
              maxLines: null,
              minLines: 5,
              controller: textController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                filled: true,
                isDense: true,
                fillColor: ColorsManager.white,
                hintText: "Message",
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
                text: "Send",
                style: TextStyleManager.textStyle24w500,
                color: ColorsManager.darkgreen,
              ),
              onPressed: () async {
                await fcmNotification(textController.text).then((value) {
                  FirebaseFireStoreService.addData(
                      tableName: TablesName.notification,
                      data: {
                        "message": textController.text,
                        "time": DateTime.now().toString(),
                      });
                }).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(
                        text: "sent successfully",
                        colorState: ColorState.sucess),
                  );
                  context.pop();
                });
              },
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
