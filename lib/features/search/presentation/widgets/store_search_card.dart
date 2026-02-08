// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fundro_app/common/widgets/custom_cached_image.dart';
// import 'package:fundro_app/core/utils/styles.dart';
// import 'package:fundro_app/features/address/presentation/controllers/address_controller.dart';
// import 'package:fundro_app/features/delivery_price/domain/models/delivery_price_body_model.dart';
// import 'package:fundro_app/features/delivery_price/presentation/controllers/delivery_price_controller.dart';
// import 'package:fundro_app/features/favorite/presentation/controllers/favorite_controller.dart';
// import 'package:fundro_app/features/home/presentation/controllers/home_controller.dart';
// import 'package:fundro_app/features/splash/presentation/controllers/splash_controller.dart';
// import 'package:fundro_app/features/stores/domain/models/store_model.dart';
// import 'package:fundro_app/features/stores/presentation/controllers/store_controller.dart';
// import 'package:fundro_app/features/stores/presentation/screens/store_screen.dart';

// class StoreSearchCard extends StatelessWidget {
//   final StoreModel store;

//   const StoreSearchCard({super.key, required this.store});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         final storeController = Get.find<StoreController>();
//         storeController.getItemList(store.id);
//         storeController.getCategories(store.id);
//         final deliveryPriceController = Get.find<DeliveryPriceController>();
//         final addressController = Get.find<AddressController>();
//         deliveryPriceController.calculateDeliveryPrice(
//           DeliveryPriceBodyModel(
//             userLatitude: addressController.address!.latitude!,
//             userLongitude: addressController.address!.longitude!,
//             restaurantLatitude: store.latitude,
//             restaurantLongitude: store.longitude,
//             pricePerKm: Get.find<SplashController>().configModel!.deliveryFeePerKm,
//           ),
//         );
//         if (Get.find<HomeController>().isLogin) {
//           Get.find<FavoriteController>().getFavoriteList();
//         }

//         Get.to(() => StoreScreen(store: store));
//       },
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               CustomCachedImage(
//                 imageUrl: store.logo!,
//                 height: 60,
//                 width: 60,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(store.name, style: cairoBold),
//                     Text(store.address, style: cairoRegular.copyWith(color: Colors.grey)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }