import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class LogoAndWlcomeMessage extends StatelessWidget {
 final String tite,description;
  const LogoAndWlcomeMessage({
    super.key,
    required this.tite,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImagesManager.logo,
          scale: 1 / 1,
          width: context.deviceWidth * 0.35,
        ),
        CustomText(
          text: tite,
          style: TextStyleManager.textStyle32w700,
        ),
        CustomText(
          text: description,
          style: TextStyleManager.textStyle20w400,
        ),
      ],
    );
  }
}