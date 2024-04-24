import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/user_model.dart';

class ReportsAndInsightsScreen extends StatelessWidget {
  const ReportsAndInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Reports and Insights",
          style: TextStyleManager.textStyle30w700,
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFireStoreService.getDocsData(
            tableName: TablesName.users, fromJson: UserModel.fromJson),
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.r,
              horizontal: 25.r,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ReportAndInsightsItem(
                      text: "Total Memberships: ${snapshot.data?.length}"),
                  AppSizedBox.h32,
                  ReportAndInsightsItem(
                      text:
                          "Total Trainers:${snapshot.data?.where((element) => element.role == "trainer").length}"),
                  AppSizedBox.h32,
                  ReportAndInsightsItem(
                      text:
                          "Total Sales: ${getAllSales(userModel: snapshot.data ?? [])}\$"),
                  AppSizedBox.h32,
                  ReportAndInsightsItem(
                      text:
                          "Active members:${snapshot.data?.where((element) => element.role == "customer").length}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  double getAllSales({required List<UserModel> userModel}) {
    double total = 0;
    for (var element in userModel) {
      total += element.subscription!;
    }
    return total;
  }
}

class ReportAndInsightsItem extends StatelessWidget {
  final String text;
  const ReportAndInsightsItem({
    super.key,
    required this.text,
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
              text: text,
              textAlign: TextAlign.center,
              style: TextStyleManager.textStyle18w600,
            ),
          ),
        ],
      ),
    );
  }
}
