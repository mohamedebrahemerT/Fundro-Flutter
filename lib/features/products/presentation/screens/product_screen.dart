import 'package:fundro_app/features/products/presentation/widgets/custom_app_bar.dart';
import 'package:fundro_app/features/products/presentation/widgets/filter_sort_bar.dart';
import 'package:fundro_app/features/products/presentation/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProductsAppBar(
        title: "Product Details",
        onBackTap: () => Navigator.pop(context),
        onSearchTap: () {},
        onFilterTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(children: [FilterSortBar(), ProductsGridView()]),
      ),
    );
  }
}
