import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/features/products/presentation/screens/product_screen.dart';
import 'package:fundro_app/theme/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final String categoryImage;

  const CategoryWidget({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeExtraSmall,
        ),
        child: Container(
          alignment: Alignment.center,
          width: Dimensions.width * 0.28,

          // height: Dimensions.height * 0.09,
          decoration: CustomDecoration.getDecoration(
            context: context,
            borderRadius: Dimensions.radiusExtraLarge + 30,
            borderColor: Theme.of(context).hintColor,
          ),
          child: Text(categoryName, style: cairoRegular),
        ),
      ),
    );
  }
}
