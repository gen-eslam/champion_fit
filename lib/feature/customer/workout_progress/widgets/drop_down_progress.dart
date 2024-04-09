import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class DropDownProgress extends StatefulWidget {
  const DropDownProgress({
    super.key,
  });

  @override
  State<DropDownProgress> createState() => _DropDownProgressState();
}

class _DropDownProgressState extends State<DropDownProgress> {
  String value = "Weekly";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsManager.yellowClr,
      ),
      child: DropdownButton(
        dropdownColor: ColorsManager.yellowClr,
        padding: EdgeInsets.symmetric(
          horizontal: 10.r,
        ),
        hint: CustomText(
          text: value,
          style: TextStyleManager.textStyle14w600,
          color: ColorsManager.darkgreen,
        ),
        underline: const SizedBox(),
        onChanged: (value) {
          setState(() {
            this.value = value.toString();
          });
        },
        items: const [
          DropdownMenuItem(
            value: "Weekly",
            child: Text("Weekly"),
          ),
          DropdownMenuItem(
            value: "Monthly",
            child: Text("Monthly"),
          ),
          DropdownMenuItem(
            value: "Anual",
            child: Text("Anual"),
          ),
        ],
      ),
    );
  }
}
