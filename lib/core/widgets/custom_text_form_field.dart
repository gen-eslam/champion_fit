import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String text;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomTextFormFeild({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.validator,
    this.suffixIcon,
    this.controller,
  });

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool obscureText = true;
  OutlineInputBorder border(BuildContext context) => OutlineInputBorder(
        borderSide: BorderSide(
          color: context.theme.primaryColor,
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
      cursorColor: ColorsManager.yellowClr,
      obscuringCharacter: "*",
      style: const TextStyle(
        color: ColorsManager.white,
      ),
      decoration: InputDecoration(
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
          color: context.theme.primaryColor,
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
        border: border(context),
        enabledBorder: border(context),
        focusedBorder: border(context),
        errorBorder: border(context),
        focusedErrorBorder: border(context),
      ),
    );
  }
}
