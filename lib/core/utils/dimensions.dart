import 'package:get/get.dart' hide Response;

class Dimensions {
  static double width = Get.context!.width;
  static double height = Get.context!.height;

  static double rw(double value) {
    return width * (value / 375);
  }

  static double rh(double value) {
    return height * (value / 812);
  }

  static double fontSizeOverSmall = width >= 1300 ? 12 : 10;
  static double fontSizeExtraSmall = width >= 1300 ? 14 : 12;
  static double fontSizeSmall = width >= 1300 ? 16 : 14;
  static double fontSizeDefault = width >= 1300 ? 18 : 16;
  static double fontSizeLarge = width >= 1300 ? 20 : 18;
  static double fontSizeExtraLarge = width >= 1300 ? 22 : 20;
  static double fontSizeOverLarge = width >= 1300 ? 28 :26;

  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeDefault = 15.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeExtremeLarge = 30.0;
  static const double paddingSizeExtraOverLarge = 35.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;

  static const double webMaxWidth = 1170;
  static const int messageInputLength = 1000;
}
