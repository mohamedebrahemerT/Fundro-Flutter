import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/features/category/presentation/wisgets/category_widget.dart';
import 'package:fundro_app/features/category/presentation/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dimensions.height * 0.01,
      children: [
        // SizedBox(height: Dimensions.height * 0.01),
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: Dimensions.paddingSizeDefault,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text("categories".tr, style: cairoBold),
        //       Text(
        //         "view_all".tr,
        //         style: cairoRegular.copyWith(
        //           color: Colors.blue,
        //           decoration: TextDecoration.underline,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: Dimensions.height * 0.08,
          child: GetBuilder<CategoryController>(
            builder: (categoryController) {
              // Show loading indicator
              if (categoryController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // Show empty state
              if (categoryController.categories.isEmpty) {
                return Center(
                  child: Text("no_categories".tr, style: cairoRegular),
                );
              }

              // Show categories list
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categories.length,
                itemBuilder: (context, index) {
                  final category = categoryController.categories[index];
                  return CategoryWidget(
                    categoryId: category.id,
                    categoryName: category.name,
                    categoryImage: category.image,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
