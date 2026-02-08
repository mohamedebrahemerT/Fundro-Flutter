// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:fundro_app/core/helper/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) {
    String message ="";
    if(response.statusCode == 401 ) {
      // Get.find<AuthController>().clearSharedData(removeToken: false).then((value) {
        // Get.find<FavouriteController>().removeFavourite();
        // Get.offAllNamed(RouteHelper.getInitialRoute());
      // });.

      // message = "${response.data?['message']}";
      showCustomSnackBar("يجب عليك تسجيل الدخول اولا", getXSnackBar: getXSnackBar);
    }else if (response.data?['error_details']!=null &&response.data['error_details'].contains("الرصيد")) {
showCustomSnackBar(response.data?['error_details'], getXSnackBar: getXSnackBar);
    }

   
  else { 
        if (response.data?['errors']["email"]!= null) {
        message = "${response.data?['errors']["email"][0]}";
      } else if (response.data?['errors']["phone_number"]!= null) {
        message = "${response.data?['errors']["phone_number"][0]}";
      }
// if (message.isNotEmpty) {
//   showCustomSnackBar(message, getXSnackBar: getXSnackBar);
// }
 else {
  // showCustomSnackBar("Unexpected error occurred", getXSnackBar: getXSnackBar);
}

    
  }
  }
}
