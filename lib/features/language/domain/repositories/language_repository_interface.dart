import 'dart:ui';

import 'package:get/get.dart' hide Response;

abstract class LanguageRepositoryInterface extends Translations {
  Locale getLocaleFromSharedPref();
  void saveLanguage(Locale locale);
  void saveCacheLanguage(Locale locale);
  Locale getCacheLocaleFromSharedPref();
}
