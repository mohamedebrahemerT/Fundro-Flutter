import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAppScreen extends StatelessWidget {
  const UpdateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.updateApp),
          Text("update_title".tr, style: cairoBlack),
          SizedBox(height: Dimensions.height * 0.05),
          SizedBox(
            height: Dimensions.height * 0.12,
            width: Dimensions.height * 0.40,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeExtremeLarge,
              ),
              child: Text(
                "update_description".tr,
                style: cairoMedium.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height * 0.05),
          CustomButton(
            text: 'update_button'.tr,
            height: Dimensions.height * 0.05,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
