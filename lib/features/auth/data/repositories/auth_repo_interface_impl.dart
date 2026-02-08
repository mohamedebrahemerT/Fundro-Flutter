import 'package:fundro_app/common/widgets/main_layout.dart';
import 'package:fundro_app/core/api/api_checker.dart';
import 'package:dio/dio.dart';
import 'package:fundro_app/core/api/api_client.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/features/auth/domain/models/signup_body_model.dart';
import 'package:fundro_app/features/auth/domain/repositories/auth_repo_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoInterfaceImpl implements AuthRepoInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepoInterfaceImpl({
    required this.apiClient,
    required this.sharedPreferences,
  });

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    Response response = await apiClient.postData(AppConstants.login, {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200 &&
        response.data['success'] == true &&
        response.data["status-code"] == 200) {
      // showCustomSnackBar('login_successful'.tr, isError: false);
      await sharedPreferences.setBool(AppConstants.isLogin, true);
      int userId = response.data['data']['user']['id'];
      String token = response.data['data']['token'];
      await Get.find<FlutterSecureStorage>().write(
        key: AppConstants.token,
        value: token,
      );
      Get.find<ApiClient>().updateHeader(token);
      await sharedPreferences.setInt(AppConstants.userKey, userId);
      Get.offAll(() => MainLayout());
    } else {
      ApiChecker.checkApi(response);
    }
    return response;
  }

  @override
  Future<Response> registration({required SignUpBodyModel body}) async {
    Response response = await apiClient.postData(AppConstants.registrationUrl, {
      'name': body.name,
      'email': body.email,
      'password': body.password,
      'password_confirmation': body.passwordConfirmation,
      'phone': body.phone,
    });
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        response.data['success'] == true &&
        response.data["status-code"] == 201) {
      login(email: body.email!, password: body.password!);
    } else {
      ApiChecker.checkApi(response);
    }
    return response;
  }

  @override
  Future<Response> deleteAccount() {
    return apiClient.deleteData(AppConstants.deleteAccount);
  }

  @override
  Future<Response> loginWithOtp(String phone) {
    return apiClient.postData(AppConstants.loginWithOtp, {
      'phone_number': phone,
    });
  }

  @override
  Future<Response> resendOtp(String phone) {
    return apiClient.postData(AppConstants.resendOtp, {'phone_number': phone});
  }

  @override
  Future<Response> verifyOtp(String phone, String otp, String fcmToken) {
    return apiClient.postData(AppConstants.verifyOtp, {
      'phone_number': phone,
      'otp': otp,
      'fcm_token': fcmToken,
    });
  }

  @override
  Future<Response> updateFcmToken(String fcmToken) {
    return apiClient.postData(AppConstants.updateFcomTokenUrl, {
      'fcm_token': fcmToken,
    });
  }
}
