import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fundro_app/core/api/api_client.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/features/language/domain/repositories/language_repository_interface.dart';


class LanguageRepositoryIntefaceImpl implements LanguageRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LanguageRepositoryIntefaceImpl({required this.apiClient, required this.sharedPreferences});

  // @override
  // AddressModel? getAddressFormSharedPref() {
  //   AddressModel? addressModel;
  //   try {
  //     addressModel = AddressModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.userAddress)!));
  //   }catch(e) {
  //     debugPrint('Did not get shared Preferences address: $e');
  //   }
  //   return addressModel;
  // }

  // @override
  // void updateHeader(AddressModel? addressModel, Locale locale, int? moduleId) {
  //   apiClient.updateHeader(
  //     sharedPreferences.getString(AppConstants.token),
  //     //  addressModel?.zoneIds,
  //     // addressModel?.areaIds, locale.languageCode, moduleId,
  //     // addressModel?.latitude2, addressModel?.longitude2,
  //   );
  // }

  @override
  Locale getLocaleFromSharedPref() {
    return Locale(sharedPreferences.getString(AppConstants.languageCode) ?? AppConstants.languages[0].code,
        sharedPreferences.getString(AppConstants.countryCode) ?? AppConstants.languages[0].countryCode);
  }

  @override
  void saveLanguage(Locale locale) {
    sharedPreferences.setString(AppConstants.languageCode, locale.languageCode);
    sharedPreferences.setString(AppConstants.countryCode, locale.countryCode!);
  }

  @override
  void saveCacheLanguage(Locale locale) {
    sharedPreferences.setString(AppConstants.cacheLanguageCode, locale.languageCode);
    sharedPreferences.setString(AppConstants.cacheCountryCode, locale.countryCode!);
  }

  @override
  Locale getCacheLocaleFromSharedPref() {
    return Locale(sharedPreferences.getString(AppConstants.cacheLanguageCode) ?? AppConstants.languages[0].code,
        sharedPreferences.getString(AppConstants.cacheCountryCode) ?? AppConstants.languages[0].countryCode);
  }





  
  @override
  Map<String, Map<String, String>> get keys => throw UnimplementedError();

}