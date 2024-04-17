import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/routes/routes.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/icon_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:gem_app2/feature/customer/customer_home/model/diet_model.dart';

class DietItem extends StatefulWidget {
  final DietModel item;
  const DietItem({super.key, required this.item});

  @override
  State<DietItem> createState() => _DietItem();
}

class _DietItem extends State<DietItem> {
  String svg = IconManager.bookmark;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(Routes.foodDetailsScreen, arguments: widget.item);
          },
          child: Container(
            width: context.deviceWidth * 0.5,
            decoration: BoxDecoration(
              color: ColorsManager.grayClr,
              image: DecorationImage(
                image: NetworkImage(
                  widget.item.image!,
                  // scale: 1 / 1,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: InkWell(
            onTap: () {
              if (svg == IconManager.bookmark) {
                setState(() {
                  svg = IconManager.bookMarkFilled;
                });
              } else {
                setState(() {
                  svg = IconManager.bookmark;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                color: ColorsManager.grayClr.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(
                svg,
                width: 24,
                color: ColorsManager.yellowClr,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            constraints: BoxConstraints(maxWidth: context.deviceWidth * 0.35),
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: ColorsManager.grayClr.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.r,
                  ),
                  height: 15.r,
                  width: 1,
                  color: ColorsManager.yellowClr,
                ),
                Expanded(
                  child: CustomText(
                    text: widget.item.name!,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    style: TextStyleManager.textStyle12w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
