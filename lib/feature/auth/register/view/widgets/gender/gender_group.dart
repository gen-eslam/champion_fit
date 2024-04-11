import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/enums.dart';
import 'package:gem_app2/core/utils/images_manager.dart';
import 'package:gem_app2/core/utils/string_manager.dart';
import 'package:gem_app2/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:gem_app2/feature/auth/register/view/widgets/gender/gender_section.dart';

class GenderGroup extends StatefulWidget {
  const GenderGroup({
    super.key,
  });

  @override
  State<GenderGroup> createState() => _GenderGroupState();
}

class _GenderGroupState extends State<GenderGroup> {
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelection(
          title: StringManager.male,
          imagePath: ImagesManager.male,
          gender: Gender.male,
          selectedGender: selectedGender,
          onTap: () {
            setState(() {
              selectedGender = Gender.male;
              RegisterCubit.get(context).user.isFemale = false;
            });
          },
        ),
        GenderSelection(
          title: StringManager.female,
          imagePath: ImagesManager.female,
          gender: Gender.female,
          selectedGender: selectedGender,
          onTap: () {
            setState(() {
              selectedGender = Gender.female;
              RegisterCubit.get(context).user.isFemale = true;
            });
          },
        ),
      ],
    );
  }
}
