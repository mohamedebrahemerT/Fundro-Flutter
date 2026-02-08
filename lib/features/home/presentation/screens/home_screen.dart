import 'package:fundro_app/common/widgets/home_app_bar.dart';
import 'package:fundro_app/common/widgets/news_letter_card.dart';
import 'package:fundro_app/common/widgets/sale_banner.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/features/category/presentation/wisgets/categories_section.dart';
import 'package:fundro_app/features/category/presentation/wisgets/category_card.dart';
import 'package:fundro_app/features/category/presentation/wisgets/category_list_view.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/home_slider.dart';
import 'package:fundro_app/features/products/presentation/controllers/product_controller.dart';
import 'package:fundro_app/features/products/presentation/screens/product_screen.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_car.dart';
import 'package:fundro_app/features/products/presentation/widgets/products_grid_view.dart';
import 'package:fundro_app/features/products/presentation/widgets/vertical_product_card.dart';
import 'package:fundro_app/theme/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(searchController: TextEditingController()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimensions.height * 0.01,
          children: [
            HomeSlider(),
            const Center(child: CategoriesSection()),
            Divider(),
            // ProductsGridView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Explore Our Collections", style: cairoBold),
            ),
            const CategoriesList(),
            ProductCard(
              imageUrl:
                  "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
              brandName: "brandName",
              productName: "productName",
              price: "price",
              onQuickViewTap: () {
                Get.to(ProductScreen());
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("selected_for_you".tr), Text("view_all".tr)],
              ),
            ),
            GetBuilder<ProductController>(
              builder: (productController) {
                if (productController.isLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (productController.products.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text("no_products".tr),
                    ),
                  );
                }

                return ProductGridView(
                  products: productController.products,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
            ),

            SaleBanner(),
            NewsletterCard(),
            // SizedBox(height: Dimensions.height * 0.25),
          ],
        ),
      ),
    );
  }
}
