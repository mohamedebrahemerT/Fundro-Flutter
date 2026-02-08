import 'package:dio/dio.dart';
import 'package:fundro_app/features/auth/domain/models/signup_body_model.dart';
import 'package:fundro_app/features/auth/domain/repositories/auth_repo_interface.dart';
import 'package:fundro_app/features/auth/domain/services/auth_service_interface.dart';

class AuthServiceInterfaceImpl implements AuthServiceInterface {
  final AuthRepoInterface _authRepoInterface;

  AuthServiceInterfaceImpl({required AuthRepoInterface authRepoInterface})
      : _authRepoInterface = authRepoInterface;

  @override
  Future<Response> login({required String email, required String password}) async {
      return await _authRepoInterface.login(email: email, password: password);
  }

  @override
  Future<Response> registration({required SignUpBodyModel body}) async {
    return await _authRepoInterface.registration(body: body);
  }
  
  @override
  Future<Response> deleteAccount() {
    return _authRepoInterface.deleteAccount();
    
  }
  
  @override
  Future<Response> loginWithOtp(String phone) {
   return _authRepoInterface.loginWithOtp(phone);
    
  }
  
  @override
  Future<Response> resendOtp(String phone) {
    return _authRepoInterface.resendOtp(phone);
    
  
  }
  
  @override
  Future<Response> verifyOtp(String phone, String otp, String fcmToken) {
  return _authRepoInterface.verifyOtp(phone, otp, fcmToken);
    
  
  }
  
  @override
  Future<Response> updateFcmToken(String fcmToken) {
  return _authRepoInterface.updateFcmToken( fcmToken);
  }

  // @override
  // Future<UserModel?> getUserInfo(int userId) async {
  //   return await _authRepoInterface.getUserInfo( userId);
  // }
}