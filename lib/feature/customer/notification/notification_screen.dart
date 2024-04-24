import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/notification/cubit/notification_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..getNotification(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: StringManager.notifications,
            style: TextStyleManager.textStyle30w700,
          ),
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoaded) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(20.r),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      ImagesManager.logo,
                    ),
                    title: CustomText(
                      textAlign: TextAlign.start,
                      text: state.notificationList[index].title,
                      style: TextStyleManager.textStyle18w600,
                    ),
                    subtitle: CustomText(
                      textAlign: TextAlign.start,
                      text: state.notificationList[index].time,
                      color: Colors.grey,
                      style: TextStyleManager.textStyle15w400,
                    ),
                  );
                },
                itemCount: state.notificationList.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: ColorsManager.darkBlueShadeClr,
                    indent: 25,
                    endIndent: 25,
                  );
                },
              );
            } else if (state is NotificationError) {
              return Center(
                child: CustomText(
                  text: state.error,
                  style: TextStyleManager.textStyle18w600,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.yellowClr,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
