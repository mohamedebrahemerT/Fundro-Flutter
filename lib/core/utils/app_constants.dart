import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/language/domain/models/language_model.dart';
import 'package:fundro_app/features/on_boarding/domain/models/on_boarding_model.dart';

class AppConstants {
  // flutter sdk 3.35.2
  // baseurl
  static const String baseUrl = '';
  static const String imagePath = '';

  // Profile
  static const String editProfileUrl = 'api/talabaty/profile';
  static const String changePasswordUrl = 'api/talabaty/change-password';
  static const String getProfileUrl = 'api/talabaty/profile';

  static const String configUrl = 'api/config';
  // static const String configUrl = 'api/config/get_config.php';

  // Auth
  static const String registrationUrl = 'api/en/auth/register';
  static const String productsUrl = 'api/en/products';
  static const String categoryUrl = 'api/en/category/';
  static const String deleteAccount = 'api/talabaty/delete-account';
  // static const String registration = 'api/auth/signup.php';
  static const String login = 'api/talabaty/auth/login';
  static const String loginWithOtp = 'api/talabaty/auth/login-otp';
  static const String verifyOtp = 'api/talabaty/auth/verify-otp';
  static const String updateFcomTokenUrl = 'api/talabaty/update-fcm-token';
  static const String resendOtp = 'api/talabaty/auth/login-otp';

  // static const String login = 'api/auth/login.php';
  // static const String getProfileUrl = 'api/profile/get_profile.php';

  static const String walletUrl = 'api/talabaty/wallet';
  static const String walletStatisticsUrl = 'api/talabaty/wallet/statistics';
  
  // Stores
  static const String storeListUrl = 'api/restaurants';
  static const String categoriesModuleListUrl = 'api/categories';
  static const String categoriesFeaturedModuleListUrl = 'api/categories/featured';
  static const String subCategoriesListUrl = 'api/sub-categories';

  // Items
  static const String getItemsUrl = 'api/items';
  static const String searchUrl = 'api/talabaty/search?query=';

  // Cart
  static const String addToCartUrl = 'api/talabaty/cart/add';
  static const String removeFromCartUrl = 'api/talabaty/cart/remove';
  static const String updateCartUrl = 'api/talabaty/cart/add';
  static const String getCartUrl = 'api/talabaty/cart';
  static const String useCouponUrl = 'api/talabaty/coupon/use';
  static const String couponUrl = 'api/coupon/check';

  // Favorite
  static const String getFavoriteUrl = 'api/talabaty/favorites';
  static const String toggleFavoriteUrl = 'api/talabaty/favorites/toggle';
  // Orders
  static const String placeOrderUrl = 'api/talabaty/orders';
  static const String getOrdersUrl = 'api/talabaty/orders';
  static const String getOrderDetailsUrl = 'api/talabaty/orders/';

  // Modules
  static const String modulesUrl = 'api/modules';

  // Address
  static const String getAddressUrl = 'api/talabaty/addresses';
  static const String addAddressUrl = 'api/talabaty/addresses';
  static const String updateAddressUrl = 'api/talabaty/addresses/';
  static const String deleteAddressUrl = 'api/talabaty/addresses/';
  static const String policiesUrl = 'api/talabaty/policies';
  static const String calculateDeliveryPriceUri = 'api/talabaty/calculate-delivery';

  static const String fontFamily = 'Cairo';

  static const String topic = 'all_zone_customer';
  static const String zoneId = 'zoneId';
  static const String showOnBoarding = 'show_on_boarding';
  static const String userKey = 'user_id';
  static const String token = 'token';
  static const String isLogin = 'auth_key';
  static const String operationAreaId = 'operationAreaId';
  static const String moduleId = 'moduleId';
  static const String cacheModuleId = 'cacheModuleId';
  static const String localizationKey = 'X-localization';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String cookiesManagement = 'cookies_management';
  static List<LanguageModel> languages = [
      LanguageModel(
      code: 'en',
      countryCode: 'US',
      name: 'English',
      image: Images.english,
    ),
    LanguageModel(
      code: 'ar',
      countryCode: 'EG',
      name: 'العربية',
      image: Images.arabic,
    ),
  
  ];
  static List<String> settings = [
    'account_info',
    'saved_address',
    // 'change_email',
    'change_password',
    'notifications',
    'language',
    "theme",
    'log_out',
    // 'delete_account',
  ];
  static List<String> profileSettings = [
    'orders',
    'my_wallet',
  ];
  static List<String> geustSettings = [
    'notifications',
    'language',
    "theme",
    'login',
  ];

  // static List<OnBoardingModel> onBoarding = [
  //   OnBoardingModel(
  //     imageUrl: Images.onBoarding1,
  //     title: "onBoarding1_title",
  //     description: "onBoarding1_description",
  //   ),
  //   OnBoardingModel(
  //     imageUrl: Images.onBoarding2,
  //     title: "onBoarding2_title",
  //     description: "onBoarding2_description",
  //   ),
  //   OnBoardingModel(
  //     imageUrl: Images.onBoarding3,
  //     title: "onBoarding3_title",
  //     description: "onBoarding3_description",
  //   ),
  // ];

  /// Shared Key
  static String theme = "talabaty_theme";
  // static String token = "talabaty_token";
  static const String countryCode = 'talabaty_country_code';
  static const String languageCode = 'talabaty_language_code';
  static const String cacheCountryCode = 'cache_country_code';
  static const String cacheLanguageCode = 'cache_language_cod';
  static const String userAddress = 'talabaty_user_address';

  // قائمة البيانات بناءً على الصور المرفقة
static List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/onboarding1.png',
    title: 'أحدث طريقة للاستثمار في العقارات',
    description: '', 
  ),
  OnboardingModel(
    image: 'assets/images/onboarding2.png',
    title: 'احصل على وصول حصري لصناديق الاستثمار العقاري',
    description: 'استثمر في صناديق مدارة باحترافية وتوفر عوائد جذابة وإمكانية نمو رأس المال.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding3.png',
    title: 'احصل علي دخل ثابت بشكل مستمر',
    description: 'استمتع بدخلك الإيجاري فور استحقاقة حيث يودع مباشرة في محفظة فاندرو الخاصة بك',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding4.png',
    title: 'ادفع با ستخدام بطاقة الائتمان أو الخصم وأكثر',
    description: 'احصل فورا علي حصة في الصنادية التي تفضلها ابتداء من 500 sar ومع خيارات دفع مرنة تناسب اختياجاتك',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding5.png',
    title: 'مدعومون من قبل الأفضل في المجال',
    description: 'استثمر في صناديق مدارة باحترافية وتوفر عوائد جذابة وإمكانية نمو راس المال.',
  ),
];
}

// class DataStatic {
//   static List<DeliveryInstructionModel> sampleDeliveryInstructions = [
//     DeliveryInstructionModel(
//       id: 1,
//       title: "leave_at_door".tr,
//       description: "Our rider will leave your order at your door.",
//       image: "",
//     ),
//     DeliveryInstructionModel(
//       id: 2,
//       title: "meet_at_door".tr,
//       description:
//           "Our rider will meet you at your door to hand you the order.",
//       image: "",
//     ),
//     DeliveryInstructionModel(
//       id: 3,
//       title: "meet_outside".tr,
//       description: "Our rider will wait for you outside.",
//       image: "",
//     ),
//   ];

  
//   static List<String> profile = [
//     'account_info',
//     'saved_address',
//     'change_email',
//     'change_password',
//     'notifications',
//     'language',
//     'log_out',
//   ];

//   // static List<ItemModel> items = [
//   //   ItemModel(
//   //     id: 1,
//   //     categoryId: '1',
//   //     subCategoryId: "2",
//   //     name: 'Classic Beef Cheeseburger',
//   //     image: Images.burger,
//   //     description: 'A delicious beef burger with cheese, lettuce, and tomato.',
//   //     rate: 2.5,
//   //     timeForCooking: '15 minutes',
//   //     price: 49.99,
//   //     storeName: 'Burger House - Downtown Branch',
//   //   ),
//   //   ItemModel(
//   //     id: 2,
//   //     categoryId: '1',
//   //     subCategoryId: "1",
//   //     name: 'Authentic Italian Margherita Pizza',
//   //     image: Images.burger,
//   //     description:
//   //         'A savory pizza topped with mozzarella, tomatoes, and basil.',
//   //     rate: 5,
//   //     timeForCooking: '20 minutes',
//   //     price: 59.99,
//   //     storeName: 'Pizza Point - Main Street',
//   //   ),
//   //   ItemModel(
//   //     id: 3,
//   //     categoryId: '1',
//   //     subCategoryId: "1",
//   //     name: 'Fresh Salmon Avocado Sushi Roll',
//   //     image: Images.burger,
//   //     description: 'Fresh sushi rolls made with salmon, avocado, and cucumber.',
//   //     rate: 3,
//   //     timeForCooking: '10 minutes',
//   //     price: 69.99,
//   //     storeName: 'Sushi Bar - Riverside Mall',
//   //   ),
//   //   ItemModel(
//   //     id: 4,
//   //     categoryId: '2',
//   //     subCategoryId: "2",
//   //     name: 'Creamy Garlic Alfredo Pasta',
//   //     image: Images.burger,
//   //     description: 'A creamy pasta dish with garlic, cheese, and olive oil.',
//   //     rate: 1.5,
//   //     timeForCooking: '12 minutes',
//   //     price: 39.99,
//   //     storeName: 'Pasta Corner - West Branch',
//   //   ),
//   //   ItemModel(
//   //     id: 5,
//   //     categoryId: '4',
//   //     subCategoryId: "7",
//   //     name: 'Garden Fresh Vegetable Salad Bowl',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 19.99,
//   //     storeName: 'Healthy Bites - Green Plaza',
//   //   ),
//   //   ItemModel(
//   //     id: 6,
//   //     categoryId: '4',
//   //     subCategoryId: "7",
//   //     name: 'Organic Green Power Salad',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 18.50,
//   //     storeName: 'Green Bowl - Organic Foods',
//   //   ),
//   //   ItemModel(
//   //     id: 7,
//   //     categoryId: '4',
//   //     subCategoryId: "6",
//   //     name: 'Protein Packed Chicken Salad',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 20.00,
//   //     storeName: 'Fit Mealz - Healthy Choice',
//   //   ),
//   //   ItemModel(
//   //     id: 8,
//   //     categoryId: '4',
//   //     subCategoryId: "6",
//   //     name: 'Low-Carb Fresh Greens Mix',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 21.50,
//   //     storeName: 'Fit Mealz - Health Hub',
//   //   ),
//   //   ItemModel(
//   //     id: 9,
//   //     categoryId: '4',
//   //     subCategoryId: "6",
//   //     name: 'Detox Cucumber Avocado Salad',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 22.00,
//   //     storeName: 'Fit Mealz - Fresh Market',
//   //   ),
//   //   ItemModel(
//   //     id: 10,
//   //     categoryId: '4',
//   //     subCategoryId: "6",
//   //     name: 'Mediterranean Chickpea Salad',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 23.00,
//   //     storeName: 'Fit Mealz - Downtown Branch',
//   //   ),
//   //   ItemModel(
//   //     id: 11,
//   //     categoryId: '4',
//   //     subCategoryId: "9",
//   //     name: 'Seasonal Harvest Garden Salad',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 18.99,
//   //     storeName: 'Salad Spot - City Center',
//   //   ),
//   //   ItemModel(
//   //     id: 12,
//   //     categoryId: '4',
//   //     subCategoryId: "9",
//   //     name: 'Avocado Tomato Crunch Salad',
//   //     image: Images.burger,
//   //     description:
//   //         'A fresh salad with mixed greens, tomatoes, cucumbers, and dressing.',
//   //     rate: 4.3,
//   //     timeForCooking: '5 minutes',
//   //     price: 17.99,
//   //     storeName: 'Salad Spot - Green Avenue',
//   //   ),
//   // ];

//   // static List<CartModel> myCart = [
//   //   CartModel(item: items[0], quantity: 2),
//   //   CartModel(item: items[1], quantity: 3),
//   //   CartModel(item: items[2], quantity: 4),
//   //   CartModel(item: items[3], quantity: 1),
//   //   CartModel(item: items[4], quantity: 2),
//   //   CartModel(item: items[5], quantity: 1),
//   // ];
//   // static List<SubCategoryModel> subCategories = [
//   //   SubCategoryModel(
//   //     id: '1',
//   //     categoryId: '1',
//   //     image: 'assets/images/restaurants.png',
//   //     name: 'Fast Food',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '2',
//   //     categoryId: '1',
//   //     image: 'assets/images/restaurants.png',
//   //     name: 'Burgers',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '3',
//   //     categoryId: '2',
//   //     image: 'assets/images/restaurants.png',
//   //     name: 'Fresh Produce',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '4',
//   //     categoryId: '2',
//   //     image: 'assets/images/restaurants.png',
//   //     name: 'Packaged Goods',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '5',
//   //     categoryId: '3',
//   //     image: 'assets/images/restaurants.png',
//   //     name: 'Coffee',
//   //   ),
//   //   // Subcategories for Pharmacy category
//   //   SubCategoryModel(
//   //     id: '6',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Medications',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '7',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Supplements',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '8',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Personal Care',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '9',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'First Aid',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '10',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Vitamins',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '11',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Beauty Products',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '12',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Healthcare Devices',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '13',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Baby Care',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '14',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Pain Relief',
//   //   ),
//   //   SubCategoryModel(
//   //     id: '15',
//   //     categoryId: '4',
//   //     image: 'assets/images/pharmacy.png',
//   //     name: 'Cough and Cold',
//   //   ),
//   // ];

//   // static List<CategoryModel> restaurantCategories = [
//   //   CategoryModel(id: '1', name: 'Breakfast', image: Images.burger),
//   //   CategoryModel(id: '2', name: 'Pizza', image: Images.burger),
//   //   CategoryModel(id: '3', name: 'Grill', image: Images.burger),
//   //   CategoryModel(id: '4', name: 'Burger', image: Images.burger),
//   //   CategoryModel(id: '5', name: 'Sushi', image: Images.burger),
//   //   CategoryModel(id: '6', name: 'Desserts', image: Images.burger),
//   //   CategoryModel(id: '7', name: 'Seafood', image: Images.burger),
//   // ];
//   // static List<OrderModel> sampleOrders = [
//   //   OrderModel(
//   //     deliveryMan: DeliveryManModel(
//   //       id: '1',
//   //       name: 'Ahmed Diab',
//   //       phone: '+201099527790',
//   //       email: 'ahmed@gmail.com',
//   //       vehicleType: 'Bike',
//   //       image: Images.deliveryMan,
//   //       rating: 4.8,
//   //     ),
//   //     id: '1',
//   //     title: 'Burger Combo Order',
//   //     date: '23 Sep 2025 09:14 AM',
//   //     status: 'In Progress',
//   //     paymentType: 'Cash',
//   //     cancelReason: '',
//   //     item: ItemModel(
//   //       category: "0",
//   //       discountValue: 0,
//   //       finalPrice: 0,
//   //       featured: true,
//   //       offered: true,
//   //       moduleId: 1,
//   //       storeId: 2,
//   //       store: StoreModel(id: 1, name: "name", bio: "", logo: "logo", cover: "cover", deliveryPrice: 2, estimatedDeliveryTime: "2", latitude:2.5, longitude: 22, rate: 2, status: "status", moduleId: 1, createdAt: "createdAt"),
//   //       discountType: "",
//   //       id: 101,
//   //       price: 29.99,
//   //       // store: 'Burger House',
//   //       // categoryId: 'fast_food',
//   //       // subCategoryId: 'burgers',
//   //       name: 'Double Cheeseburger Combo',
//   //       image: Images.burger,
//   //       description: 'Double cheeseburger with fries and drink',
//   //       rate: 4.5,
//   //       // timeForCooking: '15 mins',
//   //     ),
//   //     store: StoreModel(
//   //       id: 1,
//   //       // userId: 31,
//   //       name: 'Burger House',
//   //       bio: 'Famous burger joint with quick service.',
//   //       logo: 'burger_logo.png',
//   //       cover: 'burger_cover.png',
//   //       deliveryPrice: 15.0,
//   //       estimatedDeliveryTime: '15 - 25 mins',
//   //       latitude: 30.0317,
//   //       longitude: 30.9627,
//   //       rate: 4.5,
//   //       status: 'active',
//   //       moduleId: 2,
//   //       createdAt: '2025-10-01 09:38:37',
//   //     ),
//   //     address: AddressModel(
//   //       id: 1,
//   //       label: 'home',
//   //       street: '123 Main St',
//   //       // area: 'Cairo',
//   //       // buildName: 'Cairo Governorate',
//   //       // country: 'Egypt',
//   //       // notes: 'Near the big mosque',
//   //       latitude: 30.0444,
//   //       longitude: 31.2357,
//   //     ),
//   //   ),
//   //   // 🔽 باقي الـ Orders تقدر تكرر بنفس الشكل مع StoreModel الجديد
//   // ];

//   final List<AddressModel> myAddresses = [
//     AddressModel(
//       id: 1,
//       addressLabel: 'house',
//       street: '123 Main St',
//       // area: 'Cairo',
//       // buildName: 'Cairo Governorate',
//       // country: 'Egypt',
//       // notes: 'Near the big mosque',
//       latitude: 30.0444,
//       longitude: 31.2357,
//     ),
//     AddressModel(
//       id: 2,
//       addressLabel: 'office',
//       street: '456 Business St',
//       // area: 'Giza',
//       // buildName: 'Giza Governorate',
//       // country: 'Egypt',
//       // notes: 'Opposite City Mall',
//       latitude: 30.0131,
//       longitude: 31.2089,
//     ),
//     AddressModel(
//       id: 3,
//       addressLabel: 'apartment',
//       street: '789 Residential St',
//       // area: 'Alexandria',
//       // buildName: 'Alexandria Governorate',
//       // country: 'Egypt',
//       // notes: 'Next to the park',
//       latitude: 31.2001,
//       longitude: 29.9187,
//     ),
//   ];
//   // static List<OrderModel> getCurrentOrders() {
//   //   return sampleOrders
//   //       .where(
//   //         (order) =>
//   //             order.status.toLowerCase() == 'in progress' ||
//   //             order.status.toLowerCase() == 'pending' ||
//   //             order.status.toLowerCase() == 'preparing',
//   //       )
//   //       .toList();
//   // }

//   // static List<OrderModel> getPreviousOrders() {
//   //   return sampleOrders
//   //       .where(
//   //         (order) =>
//   //             order.status.toLowerCase() == 'delivered' ||
//   //             order.status.toLowerCase() == 'cancelled',
//   //       )
//   //       .toList();
//   // }
// }
