// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart' hide Response;
import 'package:fundro_app/features/auth/domain/models/signup_body_model.dart';
import 'package:fundro_app/features/auth/domain/services/auth_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  final AuthServiceInterface _authServiceInterface;

  AuthController({
    required AuthServiceInterface authServiceInterface,
    required SharedPreferences sharedPreferences,
  }) : _authServiceInterface = authServiceInterface;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // UserModel? _user = null;
  // UserModel? get user => _user;

  Future<void> registration(SignUpBodyModel signUpBody) async {
    _isLoading = true;
    update();
    await _authServiceInterface.registration(body: signUpBody);
    _isLoading = false;
    update();
  }
    Future<void> login(String email, String password) async {
    _isLoading = true;
    update();
    await _authServiceInterface.login(email: email, password: password);
    _isLoading = false;
    update();
  }

  Future<void> deleteAccount() async {
    await _authServiceInterface.deleteAccount();
  }



  // Future<void> loginWithOtp(String phone) async {
  //   _isLoading = true;
  //   update();

  //   Response response = await _authServiceInterface.loginWithOtp(phone);

  //   if (response.statusCode == 200 && response.data['status'] == true) {

  //     showCustomSnackBar('otp is ${response.data['otp']}', isError: false);
  //   Get.to(() => OtpVerificationScreen(phoneNumber: phone));

  //   } else {
  //     ApiChecker.checkApi(response);
  //   }

  //   _isLoading = false;
  //   update();
  //   // return response;
  // }
  // Future<void> resendOtp(String phone) async {
  //   _isLoading = true;
  //   update();

  //   Response response = await _authServiceInterface.resendOtp(phone);

  //   if (response.statusCode == 200 && response.data['status'] == true) {

  //   // Get.to(() => OtpVerificationScreen(phoneNumber: phone));
  //    showCustomSnackBar('otp is ${response.data['otp']}', isError: false);
  //     showCustomSnackBar('otp_resend_successful'.tr, isError: false);
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }

  //   _isLoading = false;
  //   update();
  //   // return response;
  // }
  // Future<void> updateFcmToken(String fcmToken)  async {
  //   _isLoading = true;
  //   update();

  //   Response response = await _authServiceInterface.updateFcmToken(fcmToken);

  //   if (response.statusCode == 200 && response.data['status'] == true) {

  //   // Get.to(() => OtpVerificationScreen(phoneNumber: phone));
  //   //  showCustomSnackBar('${response.data['otp']}', isError: false);
  //   //   showCustomSnackBar('otp_resend_successful'.tr, isError: false);
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }

  //   _isLoading = false;
  //   update();
  //   // return response;
  // }

  // Future<void> verfiy(String phone, String otp) async {
  //   _isLoading = true;
  //   update();
  //   String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
  //   Response response = await _authServiceInterface.verifyOtp(
  //     phone,
  //     otp,
  //     fcmToken,
  //   );
  //   if (response.statusCode == 200 && response.data['status'] == true) {
  //     await _sharedPreferences.setBool(AppConstants.isLogin, true);
  //     int userId = response.data['user']['id'];
  //     String token = response.data['access_token'];
  //     await Get.find<FlutterSecureStorage>().write(
  //       key: AppConstants.token,
  //       value: token,
  //     );
  //     Get.find<ApiClient>().updateHeader(token);
  //     await _sharedPreferences.setInt(AppConstants.userKey, userId);
  //     Get.find<HomeController>().getModules(fromLogin: false);

  //     await Get.find<SplashController>().getConfig();
  //     await Get.find<HomeController>().getModules().then((_) async {
  //       await Get.find<ItemController>().getFeaturedItems();
  //       if (Get.find<HomeController>().isLogin) {
  //         await Get.find<FavoriteController>().getFavoriteList();
  //         await Get.find<ProfileController>().getProfile();
  //          await Get.find<AddressController>().getAddressList().then((_){
  //           if (Get.find<AddressController>().address==null) {
  //             Get.find<AddressController>().getCurrentLocation();
  //           }
  //         });
  //         await Get.find<OrderController>().getRunningOrders();
  //         await Get.find<CartController>().getCart();
  //         await Get.find<CartController>().getSubTotal();
  //       }
  //     });

  //     Get.offAll(() => MainLayout());
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }
  //   _isLoading = false;
  //   update();
  // }

  // Future<void> logout() async {
  //   await Get.find<FavoriteController>().clearAllFavorites();
  //   await Get.find<AddressController>().clearAddress();
  //   await Get.find<OrderController>().clearOrder();
  //   await Get.find<CartController>().clear();
  //   Get.find<ProfileController>().logout();
  //   await Get.find<SharedPreferences>().remove(AppConstants.userKey);
  //   await Get.find<SharedPreferences>().remove(AppConstants.isLogin);
  //   await Get.find<FlutterSecureStorage>().delete(key: AppConstants.token);
  //   Get.find<ApiClient>().updateHeader("null");
  //   Get.offAll(() => SignInScreen());
  //   Get.find<HomeController>().getModules(fromLogin: false);

  //   await Get.find<SplashController>().getConfig();
  //   await Get.find<HomeController>().getModules().then((_) async {
  //     await Get.find<ItemController>().getFeaturedItems();
  //   });
  // }

  // Future<void> getUserInfo() async {
  //   // _isLoading = true;
  //   // update();
  //   _user= await _authServiceInterface.getUserInfo(1);
  //   // _isLoading = false;
  //   // update();
  // }
}
