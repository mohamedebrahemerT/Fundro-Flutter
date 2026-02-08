import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/features/products/presentation/controllers/product_controller.dart';
import 'package:fundro_app/features/products/presentation/widgets/add_to_bag_bottom_bar.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_horzital_list_view.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_image_gallery.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch product details when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductController>().getProductById(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "BRANDS DEAL",
          style: TextStyle(color: Colors.black, letterSpacing: 1.5),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.black),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<ProductController>(
        builder: (productController) {
          // Show loading state
          if (productController.isLoadingDetails) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error state if product not found
          if (productController.productDetails == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    "product_not_found".tr,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("go_back".tr),
                  ),
                ],
              ),
            );
          }

          final product = productController.productDetails!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: Dimensions.height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Gallery
                ProductImageGallery(
                  mainImage: product.image,
                  images: product.variants.isNotEmpty
                      ? product.variants
                            .where(
                              (v) => v.image != null && v.image!.isNotEmpty,
                            )
                            .map((v) => v.image!)
                            .toList()
                      : [product.image],
                ),
                const SizedBox(height: 24),

                // Product Name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 8),

                // Product Price
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                // Stock Status
                Row(
                  children: [
                    Icon(
                      product.inStock ? Icons.check_circle : Icons.cancel,
                      color: product.inStock ? Colors.green : Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      product.inStock ? "in_stock".tr : "out_of_stock".tr,
                      style: TextStyle(
                        color: product.inStock ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Product Selectors (for variants)
                if (product.options.isNotEmpty)
                  ProductSelectors(product: product),

                const SizedBox(height: 24),

                // Add to Bag Bottom Bar
                const AddToBagBottomBar(),

                const SizedBox(height: 24),

                // Description
                _buildExpansionTile("description".tr, product.description),

                // Product Info
                _buildExpansionTile(
                  "product_info".tr,
                  "SKU: ${product.sku ?? 'N/A'}\n"
                  "Status: ${product.status}\n"
                  "Quantity: ${product.quantity}",
                ),

                // Variants Info
                if (product.hasVariants && product.variants.isNotEmpty)
                  _buildExpansionTile(
                    "variants".tr,
                    product.variants
                        .map(
                          (v) =>
                              "${v.name}: \$${v.price} (${v.quantity} available)",
                        )
                        .join("\n"),
                  ),

                const SizedBox(height: 24),

                // Related Products
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "related_products".tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ProductsHorizontalListView(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content, style: const TextStyle(height: 1.5)),
        ),
      ],
    );
  }
}
