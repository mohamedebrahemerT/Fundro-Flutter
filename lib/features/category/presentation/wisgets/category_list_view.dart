import 'package:fundro_app/features/category/presentation/wisgets/category_card.dart';
import 'package:fundro_app/features/category/presentation/controllers/category_controller.dart';
import 'package:fundro_app/features/products/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (categoryController) {
        // Show loading indicator
        if (categoryController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Show empty state
        if (categoryController.categories.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "no_categories".tr,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );
        }

        // Show categories list
        return ListView.builder(
          // Number of items from API
          itemCount: categoryController.categories.length,
          shrinkWrap: true,
          // Add padding around the list
          padding: const EdgeInsets.symmetric(vertical: 16),
          // Bounce physics for better UX
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final category = categoryController.categories[index];
            return CategoryCard(
              title: category.name,
              imageUrl: category.image,
              onTap: () {
                Get.to(ProductScreen());
              },
            );
          },
        );
      },
    );
  }
}
