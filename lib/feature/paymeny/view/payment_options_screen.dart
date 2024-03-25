import 'package:flutter/material.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/colors_manager.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/core/widgets/custom_elevated_button.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.deviceWidth,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: 'Payment Options',
                  style: TextStyleManager.textStyle32w700),
              AppSizedBox.h48,
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      width: context.deviceWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsManager.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.payment,
                          color: ColorsManager.white,
                        ),
                        title: CustomText(
                            textAlign: TextAlign.start,
                            text: 'Debit or Credit Card',
                            style: TextStyleManager.textStyle20w400),
                      ),
                    ),
                  ],
                ),
              ),
              AppSizedBox.h48,
              CustomElevatedButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Continue',
                  style: TextStyleManager.textStyle18w600,
                  color: ColorsManager.darkgreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
