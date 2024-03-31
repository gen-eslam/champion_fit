import 'package:flutter/material.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';

class SearchAndBackButton extends StatelessWidget {
  const SearchAndBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BackButton(
          color: ColorsManager.white,
        ),
        Expanded(
            child: TextField(
          cursorColor: ColorsManager.yellowClr,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            fillColor: ColorsManager.grayClr,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: ColorsManager.white),
          ),
        )),
      ],
    );
  }
}
