import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String text;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final bool? filled;
  final Color? fillColor;

  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool haveBorder;
  final bool readOnly;
  const CustomTextFormFeild({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.validator,
    this.filled,
    this.haveBorder = true,
    this.fillColor,
    this.readOnly = false,
    this.suffixIcon,
    this.controller,
    this.initialValue,
  });

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool obscureText = true;
  OutlineInputBorder border(BuildContext context) => OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.white,
          width: 2,
        ),
        gapPadding: AppPadding.p24,
        borderRadius: BorderRadius.circular(
          AppPadding.p16,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? obscureText : false,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.readOnly,
      cursorColor: ColorsManager.yellowClr,
      obscuringCharacter: "*",
      initialValue: widget.initialValue,
      style: const TextStyle(
        color: ColorsManager.white,
      ),
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: widget.fillColor,
        hintText: widget.text,
        hintStyle: const TextStyle(
          color: ColorsManager.white,
        ),
        labelText: widget.text,
        labelStyle: const TextStyle(
          color: ColorsManager.white,
        ),
        alignLabelWithHint: true,
        floatingLabelStyle: const TextStyle(
          color: ColorsManager.white,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: ColorsManager.white,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: FaIcon(
                  obscureText
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color:
                      obscureText ? ColorsManager.white : ColorsManager.redClr,
                  size: 20,
                ),
              )
            : null,
        border: widget.haveBorder ? border(context) : null,
        enabledBorder: widget.haveBorder ? border(context) : null,
        focusedBorder: widget.haveBorder ? border(context) : null,
        errorBorder: widget.haveBorder ? border(context) : null,
        focusedErrorBorder: widget.haveBorder ? border(context) : null,
      ),
    );
  }
}
