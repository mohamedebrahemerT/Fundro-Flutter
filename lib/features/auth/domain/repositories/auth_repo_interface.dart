import 'package:dio/dio.dart';
import 'package:fundro_app/features/auth/domain/models/signup_body_model.dart';

abstract class AuthRepoInterface {
  Future<Response> registration({required SignUpBodyModel body});
  Future<Response> login({required String email, required String password});
  Future<Response> deleteAccount();
  Future<Response> loginWithOtp(String phone);
  Future<Response> verifyOtp(String phone, String otp, String fcmToken);
  Future<Response> resendOtp(String phone, );
  Future<Response> updateFcmToken(String fcmToken );
}