import 'package:fundro_app/features/products/presentation/controllers/product_controller.dart';
import 'package:fundro_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        // Show loading indicator
        if (productController.isLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Show empty state
        if (productController.products.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text("no_products".tr),
            ),
          );
        }

        // Show products grid
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return GestureDetector(
              onTap: () {
                Get.to(ProductDetailsScreen(productId: product.id));
              },
              child: ProductCard(
                image: product.image,
                brand: product.name,
                name: product.description,
                price: product.price.toString(),
                height: 200,
              ),
            );
          },
        );
      },
    );
  }
}
