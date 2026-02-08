import 'package:fundro_app/features/products/domain/models/product_model.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_car.dart';
import 'package:fundro_app/features/products/presentation/widgets/vertical_product_card.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductModel> products;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const ProductGridView({
    super.key,
    required this.products,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.45,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return VerticalProductCard(
          imageUrl: product.image,
          brand: product.name,
          title: product.description,
          price: "\$${product.price}",
          isNew: product.isFeatured,
        );
      },
    );
  }
}
