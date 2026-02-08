import 'package:get/get.dart' hide Response;
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

final cairoRegular = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final cairoMedium = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final cairoBold = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final cairoBlack = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);

final BoxDecoration riderContainerDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
  color: Theme.of(Get.context!).primaryColor.withOpacity(0.1),
  shape: BoxShape.rectangle,
);