import 'package:fundro_app/features/products/presentation/controllers/product_controller.dart';
import 'package:fundro_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsHorizontalListView extends StatelessWidget {
  const ProductsHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        // Show loading indicator
        if (productController.isLoading) {
          return const SizedBox(
            height: 320,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // Show empty state
        if (productController.products.isEmpty) {
          return SizedBox(
            height: 320,
            child: Center(child: Text("no_products".tr)),
          );
        }

        // Show products list
        return SizedBox(
          height: 320,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              final product = productController.products[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(productId: product.id));
                  },
                  child: ProductCard(
                    image: product.image,
                    brand: product.name, // Using name as brand for now
                    name: product.description,
                    price: product.price.toString(),
                    height: 180,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
