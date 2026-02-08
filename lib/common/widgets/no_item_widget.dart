
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:fundro_app/core/utils/styles.dart';

class NotItemsWidget extends StatelessWidget {
  const NotItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: Dimensions.height * 0.02,
          children: [
            Image.asset(
              Images.notFound,
              width: 130,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              "not_found_items".tr,
              style: cairoMedium.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: Dimensions.fontSizeLarge,
              ),
            ),
          ],
        ),
      );
  }
}
