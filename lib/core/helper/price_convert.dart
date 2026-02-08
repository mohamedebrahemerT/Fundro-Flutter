// import 'package:get/get.dart';
// import 'package:fundro_app/core/utils/imports.dart';
// import 'package:fundro_app/features/splash/presentation/controllers/splash_controller.dart';

// String priceConvert(dynamic price){
//   String currencySymbol =Get.find<LanguageController>().isLtr? Get.find<SplashController>().configModel!.currency:"جم";

//   if (price is int || price is double) {
//     return Get.find<LanguageController>().isLtr? "$currencySymbol ${price.toStringAsFixed(2)}":"${price.toStringAsFixed(2)} $currencySymbol" ;
//   } else {
//     return Get.find<LanguageController>().isLtr? "$currencySymbol $price":"$price $currencySymbol" ;
    
//   }
// }