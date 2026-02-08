import 'dart:convert';

import 'package:fundro_app/common/controllers/theme_controllers.dart';
import 'package:fundro_app/core/api/api_client.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/features/auth/data/repositories/auth_repo_interface_impl.dart';
import 'package:fundro_app/features/auth/data/services/auth_service_impl.dart';
import 'package:fundro_app/features/auth/domain/repositories/auth_repo_interface.dart';
import 'package:fundro_app/features/auth/domain/services/auth_service_interface.dart';
import 'package:fundro_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:fundro_app/features/language/data/repositories/language_repository_impl.dart';
import 'package:fundro_app/features/language/data/services/language_service_impl.dart';
import 'package:fundro_app/features/language/domain/models/language_model.dart';
import 'package:fundro_app/features/language/domain/repositories/language_repository_interface.dart';
import 'package:fundro_app/features/language/domain/services/language_service_interface.dart';
import 'package:fundro_app/features/language/presentation/controllers/language_controller.dart'
    show LanguageController;
import 'package:fundro_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:fundro_app/features/products/data/services/product_service_impl.dart';
import 'package:fundro_app/features/products/domain/repositories/product_repository_interface.dart';
import 'package:fundro_app/features/products/domain/services/product_service_interface.dart';
import 'package:fundro_app/features/products/presentation/controllers/product_controller.dart';
import 'package:fundro_app/features/category/data/repositories/category_repository_impl.dart';
import 'package:fundro_app/features/category/data/services/category_service_impl.dart';
import 'package:fundro_app/features/category/domain/repositories/category_repository_interface.dart';
import 'package:fundro_app/features/category/domain/services/category_service_interface.dart';
import 'package:fundro_app/features/category/presentation/controllers/category_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;

import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Initialize core dependencies
  await _initCore();
  // Initialize repositories, services, and controllers
  _initRepos();
  _initServices();
  _initControllers();

  /// ------------------ Loading localized data ------------------

  Map<String, Map<String, String>> languages = {};

  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString(
      'assets/language/${languageModel.code}.json',
    );
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.code}_${languageModel.countryCode}'] = json;
  }

  return languages;
}

Future<void> _initCore() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  const secureStorage = FlutterSecureStorage();
  Get.lazyPut(() => secureStorage);

  Get.lazyPut(
    () => ApiClient(
      appBaseUrl: AppConstants.baseUrl,
      sharedPreferences: Get.find(),
      flutterSecureStorage: Get.find(),
    ),
  );
  // تسجيل ApiClient
  final apiClient = ApiClient(
    appBaseUrl: AppConstants.baseUrl,
    sharedPreferences: Get.find(),
    flutterSecureStorage: Get.find(),
  );

  // استدعاء init() بتاع ApiClient
  await apiClient.init();

  // تسجيله في GetX
  Get.lazyPut(() => apiClient);
}

void _initRepos() {
  // Get.lazyPut<AddressRepoInterface>(() => AddressRepoInterfaceImpl(apiClient: Get.find()));
  Get.lazyPut<AuthRepoInterface>(
    () => AuthRepoInterfaceImpl(
      apiClient: Get.find(),
      sharedPreferences: Get.find(),
    ),
  );
  // Get.lazyPut<CartRepoInterface>(() => CartRepoInterfaceImpl(apiClient: Get.find()));
  Get.lazyPut<ProductRepositoryInterface>(
    () => ProductRepositoryImpl(apiClient: Get.find()),
  );
  Get.lazyPut<CategoryRepositoryInterface>(
    () => CategoryRepositoryImpl(apiClient: Get.find()),
  );
  // Get.lazyPut<PolicyRepoInterface>(() => PolicyRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<CheckoutRepoInterface>(() => CheckoutRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<WalletRepoInterface>(() => WalletRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<DeliveryInstructionRepoInterface>(() => DeliveryInstructionRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<CouponRepoInterface>(() => CouponRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<SplashRepoInterface>(() => SplashRepoInterfaceImpl(apiClient: Get.find()));
  // Get.lazyPut<FavoriteRepoInterface>(() => FavoriteRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<HomeRepoInterface>(() => HomeRepoInterfaceImp(apiClient: Get.find()));
  Get.lazyPut<LanguageRepositoryInterface>(
    () => LanguageRepositoryIntefaceImpl(
      apiClient: Get.find(),
      sharedPreferences: Get.find(),
    ),
  );
  // Get.lazyPut<OrdersRepoInterface>(() => OrdersRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<ProfileRepoInterface>(() => ProfileRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<SearchRepoInterface>(() => SearchRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<StoresRepoInterface>(() => StoresRepoInterfaceImp(apiClient: Get.find()));
  // Get.lazyPut<ItemRepoInterface>(() => ItemRepoInterfaceImp(apiClient: Get.find()));
}

void _initServices() {
  //   Get.lazyPut<AddressServiceInterface>(() => AddressServiceInterfaceImpl(addressRepoInterface: Get.find()));
  Get.lazyPut<AuthServiceInterface>(
    () => AuthServiceInterfaceImpl(authRepoInterface: Get.find()),
  );
  Get.lazyPut<ProductServiceInterface>(
    () => ProductServiceImpl(productRepositoryInterface: Get.find()),
  );
  Get.lazyPut<CategoryServiceInterface>(
    () => CategoryServiceImpl(categoryRepositoryInterface: Get.find()),
  );
  //   Get.lazyPut<CartServiceInterfaceCartServiceInterfaceImp(cartRepoInterface: Get.find()));
  //   Get.lazyPut<DeliveryPriceServiceInterface>(() => DeliveryPriceServiceImp(deliveryPriceRepoInterface: Get.find()));
  //   Get.lazyPut<CheckoutServiceInterface>(() => CheckoutServiceInterfaceImp(checkoutRepoInterface: Get.find()));
  //   Get.lazyPut<PolicyServiceInterface>(() => PolicyServiceInterfaceImp(policyRepoInterface: Get.find()));
  //   Get.lazyPut<WalletServiceInterface>(() => WalletServiceInterfaceImp(walletRepoInterface: Get.find()));
  //   Get.lazyPut<CouponServiceInterface>(() => CouponServiceInterfaceImp(couponRepoInterface: Get.find()));
  //   Get.lazyPut<DeliveryInstructionServiceInterface>(() => DeliveryInstructionServiceInterfaceImp(deliveryInstructionRepoInterface: Get.find()));
  //   Get.lazyPut<CheckoutServiceInterface>(() => CheckoutServiceInterfaceImp(checkoutRepoInterface: Get.find()));
  //   Get.lazyPut<SplashServiceInterface>(() => SplashServiceInterfaceImpl(splashRepoInterface: Get.find()));
  //   Get.lazyPut<FavoriteServiceInterface>(() => FavoriteServiceInterfaceImp(favoriteRepoInterface: Get.find()));
  //   Get.lazyPut<HomeServiceInterface>(() => HomeServiceInterfaceImp(homeRepoInterface: Get.find()));
  Get.lazyPut<LanguageServiceInterface>(
    () => LanguageServiceInterfaceImpl(languageRepositoryInterface: Get.find()),
  );
  //   Get.lazyPut<OrdersServiceInterface>(() => OrdersServiceInterfaceImp(ordersRepoInterface: Get.find()));
  //   Get.lazyPut<ProfileServiceInterface>(() => ProfileServiceInterfaceImp(profileRepoInterface: Get.find()));
  //   Get.lazyPut<SearchServiceInterface>(() => SearchServiceInterfaceImp(searchRepoInterface: Get.find()));
  //   Get.lazyPut<StoresServiceInterface>(() => StoresServiceInterfaceImp(storesRepoInterface: Get.find()));
  //   Get.lazyPut<ItemServiceInterface>(() => ItemServiceInterfaceImp(itemRepoInterface: Get.find()));
}

void _initControllers() {
  // These controllers are initialized immediately with `Get.put`
  // to handle essential app start-up logic (e.g., loading config, auth state, language).
  // Get.put(SplashController(splashServiceInterface: Get.find()));
  Get.put(LanguageController(languageServiceInterface: Get.find()));
  Get.put(
    AuthController(
      authServiceInterface: Get.find(),
      sharedPreferences: Get.find(),
    ),
  );

  // ThemeController is lazy-loaded but used early in the widget tree.
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  // Get.lazyPut(() => DeliveryPriceController(deliveryPriceServiceInterface: Get.find()));

  // // Other feature controllers are lazy-loaded to be created only when needed.
  Get.lazyPut(() => ProductController(productServiceInterface: Get.find()));
  Get.lazyPut(() => CategoryController(categoryServiceInterface: Get.find()));
  // Get.lazyPut(() => CartController(cartServiceInterface: Get.find()));
  // Get.lazyPut(() => CheckoutController(checkoutServiceInterface: Get.find()));
  // Get.lazyPut(() => PolicyController(policyServiceInterface: Get.find()));
  // Get.lazyPut(() => WalletController(walletServiceInterface: Get.find()));
  // Get.lazyPut(() => CheckoutController(checkoutServiceInterface: Get.find()));
  // Get.lazyPut(() => CouponController(couponServiceInterface: Get.find()));
  // Get.lazyPut(() => DeliveryInstructionController(deliveryInstructionServiceInterface: Get.find()));
  // Get.lazyPut(() => CustomSearchController(searchServiceInterface: Get.find()));
  // Get.lazyPut(() => FavoriteController(favoriteServiceInterface: Get.find()));
  // Get.lazyPut(() => HomeController(homeServiceInterface: Get.find()));
  // Get.lazyPut(() => OrderController(ordersServiceInterface: Get.find()));
  // Get.lazyPut(() => ProfileController(profileServiceInterface: Get.find()));
  // Get.lazyPut(() => StoreController(storesServiceInterface: Get.find()));
  // Get.lazyPut(() => ItemController(itemServiceInterface: Get.find()));
}
