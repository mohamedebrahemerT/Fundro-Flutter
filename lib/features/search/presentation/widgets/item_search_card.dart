
// import 'package:fundro_app/common/widgets/custom_cached_image.dart';
// import 'package:fundro_app/core/utils/styles.dart';
// import 'package:fundro_app/core/helper/price_convert.dart';
// import 'package:flutter/material.dart';

// class ItemSearchCard extends StatelessWidget {
//   // final ItemModel item;

//   const ItemSearchCard({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => showItemDetails(context, item),
//       // onTap: () => showItemSearchDetails(context, item),
//       child: Container(
//         padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//           border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.3)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // الصورة
//             ClipRRect(
//               borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//               child: CustomCachedImage(
//                 imageUrl: item.image??"",
//                 fit: BoxFit.cover,
//                 height: 100,
//                 width: double.infinity,
//               ),
//             ),
//             SizedBox(height: Dimensions.paddingSizeSmall),
      
//             // الاسم
//             Text(
//               item.name,
//               style: cairoRegular.copyWith(
//                 fontSize: Dimensions.fontSizeSmall,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               maxLines: 2,
//             ),
      
//             SizedBox(height: Dimensions.paddingSizeSmall / 2),
      
//             // السعر
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   priceConvert(item.price),
//                   style: cairoRegular.copyWith(
//                     color: Theme.of(context).primaryColor,
//                     fontSize: Dimensions.fontSizeExtraSmall,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
