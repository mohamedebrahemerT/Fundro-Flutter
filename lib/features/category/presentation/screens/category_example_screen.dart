import 'package:fundro_app/common/widgets/custom_cached_image.dart';
import 'package:fundro_app/features/category/domain/models/category_model.dart';
import 'package:fundro_app/features/category/presentation/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Example usage of CategoryController
///
/// This widget demonstrates how to use the CategoryController
/// to fetch and display categories in your app.
class CategoryExample extends StatelessWidget {
  const CategoryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GetBuilder<CategoryController>(
        builder: (categoryController) {
          // Show loading indicator while fetching categories
          if (categoryController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show empty state if no categories
          if (categoryController.categories.isEmpty) {
            return const Center(child: Text('No categories found'));
          }

          // Display categories in a list
          return ListView.builder(
            itemCount: categoryController.categories.length,
            itemBuilder: (context, index) {
              CategoryModel category = categoryController.categories[index];
              return ListTile(
                leading: category.image.isNotEmpty
                    ? CustomCachedImage(
                        imageUrl: category.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        borderRadius: 8,
                      )
                    : const Icon(Icons.category),
                title: Text(category.name),
                subtitle: Text('ID: ${category.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
