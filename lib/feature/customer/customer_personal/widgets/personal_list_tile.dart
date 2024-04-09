
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class PersonalListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final void Function() onTap;
  const PersonalListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: ColorsManager.white,
        ),
        title: CustomText(
          text: title,
          textAlign: TextAlign.start,
          style: TextStyleManager.textStyle15w400,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: ColorsManager.white,
          size: 20.r,
        ),
      ),
    );
  }
}
