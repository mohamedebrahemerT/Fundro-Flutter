// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fundro_app/common/widgets/custom_cached_image.dart';
// import 'package:fundro_app/common/widgets/quantity_widget.dart';
// import 'package:fundro_app/common/widgets/rate_widget.dart';
// import 'package:fundro_app/core/utils/dimensions.dart';
// import 'package:fundro_app/core/utils/imports.dart';
// import 'package:fundro_app/core/utils/styles.dart';
// import 'package:fundro_app/features/cart/presentation/controllers/cart_controller.dart';
// import 'package:fundro_app/features/item/domain/models/item_model.dart';
// import 'package:fundro_app/core/helper/custom_snackbar.dart';
// import 'package:fundro_app/core/helper/price_convert.dart';

// class ItemDetailsSheet extends StatelessWidget {
//   final ItemModel item;
//   final bool fromSearch;

//   const ItemDetailsSheet({
//     super.key,
//     required this.item,
//     this.fromSearch = false,
//   });

//   @override
//   Widget build(BuildContext context) {
    
//     return GetBuilder<CartController>(
//       builder: (cartController) {
//         // Determine if the item is in the cart and get its details
//         final bool isInCart = cartController.isInCart(item.id);
//         int initialQuantity = 1;
//         if (Get.find<HomeController>().isLogin && isInCart) {
//           cartController.getCartItem(item.id);
//           if (cartController.cartItem != null) {
//             initialQuantity = cartController.cartItem!.quantity;
//           }
//         }

//         // Use StatefulBuilder to manage local state for quantity and total price
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             int quantity = initialQuantity;
//             double totalPrice = item.price * quantity;

//             return Padding(
//               padding: EdgeInsets.only(
//                 top: Dimensions.rh(20),
//                 left: Dimensions.rw(20),
//                 right: Dimensions.rw(20),
//                 bottom: Dimensions.rh(20),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(item.name, style: cairoBold),
//                               if (!fromSearch) ...[
//                                 Text(
//                                   item.store?.name ?? "",
//                                   style: cairoMedium.copyWith(
//                                     color: Theme.of(context).hintColor,
//                                   ),
//                                 ),
//                                 RateWidget(rate: item.rate),
//                               ],
//                               Text(
//                                 priceConvert(item.price),
//                                 // '${"price".tr}: ${priceConvert(item.price)}',
//                                 style: cairoBold,
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Dimensions.rh(100),
//                           width: Dimensions.rw(120),
//                           child: CustomCachedImage(
//                             imageUrl: item.image ?? "",
//                             borderRadius: Dimensions.radiusDefault,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: Dimensions.rh(10)),
//                     if (!fromSearch) ...[
//                       Text("description".tr, style: cairoBold),
//                       Text(
//                         item.description,
//                         style: cairoMedium.copyWith(
//                           color: Theme.of(context).hintColor,
//                         ),
//                       ),
//                     ],
//                     SizedBox(height: Dimensions.rh(20)),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: Dimensions.rw(8),
//                           ),
//                           height: Dimensions.rh(50),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               Dimensions.radiusExtraLarge,
//                             ),
//                             border: Border.all(
//                               color: Theme.of(context).hintColor,
//                             ),
//                           ),
//                           child: QuantityWidget(
//                             quantity: quantity,
//                             onIncrement: () {
//                               setState(() {
//                                 quantity++;
//                               });
//                             },
//                             onDecrement: () {
//                               if (quantity > 1) {
//                                 setState(() {
//                                   quantity--;
//                                 });
//                               }
//                             },
//                           ),
//                         ),
//                         SizedBox(width: Dimensions.width * 0.02),
//                         Flexible(
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Theme.of(context).primaryColor,
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: Dimensions.rw(20),
//                                 vertical: Dimensions.rh(12),
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                   Dimensions.radiusDefault,
//                                 ),
//                               ),
//                             ),
//                             onPressed: () {
//                                if (!Get.find<HomeController>().isLogin) {
//                               Get.back();
//                               showCustomSnackBar("must_login".tr);
//                             } else{
//                               if (isInCart) {
//                                 cartController.updateItemToCart(
//                                   itemId: item.id,
//                                   quantity: quantity,
//                                   storeId: item.store!.id,
//                                 );
//                               } else {
//                                 cartController.addItemToCart(
//                                   itemId: item.id,
//                                   quantity: quantity,
//                                   storeId: item.store!.id,
//                                 );
//                               }
//                               Get.back();
//                             }
//                               if (isInCart) {
//                                 cartController.updateItemToCart(
//                                   itemId: item.id,
//                                   quantity: quantity,
//                                   storeId: item.store!.id,
//                                 );
//                               } else {
//                                 cartController.addItemToCart(
//                                   itemId: item.id,
//                                   quantity: quantity,
//                                   storeId: item.store!.id,
//                                 );
//                               }
//                               Get.back();
//                             },
//                             child: FittedBox(
//                               fit: BoxFit.scaleDown,
//                               child: Text(
//                                 isInCart
//                                     ? "${"update_item_in_cart".tr} (${priceConvert(totalPrice)})"
//                                     : "${"add_to_cart".tr} (${priceConvert(totalPrice)})",
//                                 style: cairoMedium.copyWith(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
