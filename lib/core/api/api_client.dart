import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:fundro_app/core/api/api_checker.dart';
import 'package:fundro_app/core/helper/custom_snackbar.dart';
import 'package:fundro_app/core/helper/responsive_helper.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage flutterSecureStorage;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 40;

  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
    required this.sharedPreferences,
    required this.flutterSecureStorage,
  }) {
    _mainHeaders = {
      'Accept': "application/json",
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
    ),
  );

  Future<void> init() async {
    token = await flutterSecureStorage.read(key: AppConstants.token);
    if (kDebugMode) {
      print("init call succefuly");
      print('Token: $token');
    }
    updateHeader(token, setHeader: true);
  }

  Map<String, String> updateHeader(String? token, {bool setHeader = true}) {
    Map<String, String> header = {
      'Accept': "application/json",
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    if (setHeader) {
      _mainHeaders = header;
    }
    return header;
  }

  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    bool handleError = true,
  }) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
      }
      var response = await _dio.get(
        uri,
        queryParameters: query,
        options: Options(headers: headers ?? _mainHeaders),
      );
      return handleResponse(response, uri, handleError);
    } 
    on DioException catch (e) {
      if (e.response==null) {
        
      return Response(statusCode: 1, statusMessage: noInternetMessage, requestOptions: RequestOptions(path: uri));
      } else {
        
      return handleResponse(e.response!, uri, handleError);
      }
      // showCustomSnackBar(noInternetMessage);
      // if (kDebugMode) {
      //   print('------------${e.toString()}');
      // }
      // return Response(statusCode: 1, statusMessage: noInternetMessage, requestOptions: RequestOptions(path: uri));
    }
  }
Future<Response> patchData(
  String uri,
  dynamic body, {
  Map<String, String>? headers,
  bool handleError = true,
}) async {
  try {
    if (kDebugMode) {
      print('====> API PATCH Call: $uri');
      print('====> Headers: ${headers ?? _mainHeaders}');
      print('====> Body: $body');
    }

    final response = await _dio.patch(
      uri,
      data: jsonEncode(body),
      options: Options(headers: headers ?? _mainHeaders),
    );

    if (kDebugMode) {
      print('✅ PATCH Response [${response.statusCode}]: ${response.data}');
    }

    return handleResponse(response, uri, handleError);
  } on DioException catch (e) {
    if (kDebugMode) {
      print('❌ PATCH DioException for [$uri]');
      print('❌ Response: ${e.response?.data}');
    }

    if (e.response != null) {
      showCustomSnackBar(
        e.response?.data['message']?.toString() ?? 'unexpected_error'.tr,
      );
      return handleResponse(e.response!, uri, handleError);
    } else {
      showCustomSnackBar(noInternetMessage);
      return Response(
        statusCode: 0,
        statusMessage: noInternetMessage,
        requestOptions: RequestOptions(path: uri),
      );
    }
  } catch (e) {
    if (kDebugMode) {
      print('💥 PATCH Unexpected Error: ${e.toString()}');
    }
    showCustomSnackBar('unexpected_error'.tr);
    return Response(
      statusCode: 1,
      statusMessage: noInternetMessage,
      requestOptions: RequestOptions(path: uri),
    );
  }
}

  Future<Response> postData(
    String uri,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    int? timeout,
    bool handleError = true,
  }) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri');
        print('====> Headers: ${headers ?? _mainHeaders}');
        print('====> Body: $body');
      }

      final response = await _dio.post(
        uri,
        data: FormData.fromMap(body),
        options: Options(
          headers: {..._mainHeaders, ...(headers ?? {})},
          contentType: "multipart/form-data",
        ),
      );

      if (kDebugMode) {
        print("✅ API Response [${response.statusCode}]: ${response.data}");
      }

      return handleResponse(response, uri, handleError);
    } on DioException catch (e) {
      final res = e.response?.data;
      final statusCode = e.response?.statusCode;

      if (kDebugMode) {
        print("❌ DioException caught for [$uri]");
        print("❌ Status code: $statusCode");
        print("❌ Response: $res");
      }

      if (e.response != null) {
        if ( !e.response?.data['message'].contains("طلب")) {
          
        showCustomSnackBar(
          e.response?.data['message']?.toString() ?? 'unexpected_error'.tr,
        );
        }
        return handleResponse(e.response!, uri, handleError);
      }

      showCustomSnackBar(noInternetMessage);
      return Response(
        statusCode: 0,
        statusMessage: 'No response from server',
        requestOptions: RequestOptions(path: uri),
      );
    } catch (e) {
      showCustomSnackBar('unexpected_error'.tr);
      if (kDebugMode) {
        print('💥 Unexpected Error: ${e.toString()}');
      }

      return Response(
        statusCode: 1,
        statusMessage: noInternetMessage,
        requestOptions: RequestOptions(path: uri),
      );
    }
  }

  Future<Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
    bool handleError = true,
  }) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body with ${multipartBody.length} picture');
      }

      FormData formData = FormData.fromMap(body);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          formData.files.add(
            MapEntry(
              multipart.key,
              await MultipartFile.fromFile(
                multipart.file!.path,
                filename: multipart.file!.name,
              ),
            ),
          );
        }
      }

      var response = await _dio.post(
        uri,
        data: formData,
        options: Options(headers: headers ?? _mainHeaders),
      );

      return handleResponse(response, uri, handleError);
    } catch (e) {
      showCustomSnackBar(noInternetMessage);
      if (kDebugMode) {
        print('------------${e.toString()}');
      }
      return Response(
        statusCode: 1,
        statusMessage: noInternetMessage,
        requestOptions: RequestOptions(path: uri),
      );
    }
  }

  Future<Response> putData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
    bool handleError = true,
  }) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body');
      }
      var response = await _dio.put(
        uri,
        data: jsonEncode(body),
        options: Options(headers: headers ?? _mainHeaders),
      );
      return handleResponse(response, uri, handleError);
    } on DioException catch (e) {
      return handleResponse(e.response!, uri, handleError);
      // showCustomSnackBar(noInternetMessage);
      // return Response(statusCode: 1, statusMessage: noInternetMessage, requestOptions: RequestOptions(path: uri));
    }
  }

  Future<Response> deleteData(
    String uri, {
    Map<String, String>? headers,
    bool handleError = true,
  }) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
      }
      var response = await _dio.delete(
        uri,
        options: Options(headers: headers ?? _mainHeaders),
      );
      return handleResponse(response, uri, handleError);
    } catch (e) {
      showCustomSnackBar(noInternetMessage);
      return Response(
        statusCode: 1,
        statusMessage: noInternetMessage,
        requestOptions: RequestOptions(path: uri),
      );
    }
  }

  Response handleResponse(Response? response, String uri, bool handleError) {
    try {
      if (kDebugMode) {
        print('====> API Response: [${response!.statusCode}] $uri');
        if (!ResponsiveHelper.isWeb() || response.statusCode != 500) {
          print('${response.data}');
        }
      }
      if (response != null) {
        if (handleError) {
          if (response.statusCode == 200 || response.statusCode == 201) {
            return response;
          } else {
            // showCustomSnackBar(response.data['message']?.toString() ?? 'unexpected_error'.tr);
            ApiChecker.checkApi(response);
            return Response(requestOptions: RequestOptions(path: uri));
          }
        } else {
          return response;
        }
      } else {
        showCustomSnackBar(noInternetMessage);
        return Response(
          statusCode: 0,
          statusMessage: noInternetMessage,
          requestOptions: RequestOptions(path: uri),
        );
      }
    } catch (_) {
      // showCustomSnackBar(noInternetMessage);
      return Response(
        statusCode: 0,
        statusMessage: noInternetMessage,
        requestOptions: RequestOptions(path: uri),
      );
    }
  }
}

class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}
