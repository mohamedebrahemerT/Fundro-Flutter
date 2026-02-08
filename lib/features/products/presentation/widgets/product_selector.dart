import 'package:fundro_app/features/products/domain/models/product_model.dart';
import 'package:fundro_app/features/products/domain/models/product_option_model.dart';
import 'package:flutter/material.dart';

class ProductSelectors extends StatefulWidget {
  final ProductModel product;

  const ProductSelectors({super.key, required this.product});

  @override
  State<ProductSelectors> createState() => _ProductSelectorsState();
}

class _ProductSelectorsState extends State<ProductSelectors> {
  // Store selected option values for each option
  Map<int, int> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    // Initialize with first value of each option
    for (var option in widget.product.options) {
      if (option.values.isNotEmpty) {
        selectedOptions[option.id] = option.values.first.id;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product.options.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display each option (color, size, etc.)
        ...widget.product.options.map((option) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Option Name (Color, Size, etc.)
                Text(
                  option.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 12),

                // Option Values
                if (option.type.toLowerCase() == 'color')
                  _buildColorOptions(option)
                else
                  _buildTextOptions(option),
              ],
            ),
          );
        }).toList(),

        // Show selected variant info if available
        if (widget.product.variants.isNotEmpty) _buildVariantInfo(),
      ],
    );
  }

  // Build color options as colored circles
  Widget _buildColorOptions(ProductOption option) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: option.values.map((value) {
        final isSelected = selectedOptions[option.id] == value.id;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedOptions[option.id] = value.id;
            });
          },
          child: _colorDot(
            _getColorFromName(value.value),
            isSelected: isSelected,
            label: value.value,
          ),
        );
      }).toList(),
    );
  }

  // Build text options as chips (for size, etc.)
  Widget _buildTextOptions(ProductOption option) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: option.values.map((value) {
        final isSelected = selectedOptions[option.id] == value.id;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedOptions[option.id] = value.id;
            });
          },
          child: _sizeOption(value.value, isSelected),
        );
      }).toList(),
    );
  }

  // Build variant info based on selected options
  Widget _buildVariantInfo() {
    // Find matching variant
    final matchingVariant = widget.product.variants.firstWhere((variant) {
      // Check if all option values match
      for (var optionValue in variant.optionValues) {
        if (selectedOptions[optionValue.optionId] != optionValue.valueId) {
          return false;
        }
      }
      return true;
    }, orElse: () => widget.product.variants.first);

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                matchingVariant.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                "\$${matchingVariant.price}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                matchingVariant.quantity > 0
                    ? Icons.check_circle
                    : Icons.cancel,
                size: 16,
                color: matchingVariant.quantity > 0 ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                matchingVariant.quantity > 0
                    ? "${matchingVariant.quantity} in stock"
                    : "Out of stock",
                style: TextStyle(
                  fontSize: 12,
                  color: matchingVariant.quantity > 0
                      ? Colors.green.shade700
                      : Colors.red.shade700,
                ),
              ),
            ],
          ),
          if (matchingVariant.sku.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "SKU: ${matchingVariant.sku}",
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ),
        ],
      ),
    );
  }

  Widget _colorDot(
    Color color, {
    bool isSelected = false,
    required String label,
  }) {
    return Tooltip(
      message: label,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: color,
          radius: 18,
          child: isSelected
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : null,
        ),
      ),
    );
  }

  Widget _sizeOption(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  // Helper to convert color name to Color
  Color _getColorFromName(String colorName) {
    final name = colorName.toLowerCase();
    switch (name) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'brown':
        return Colors.brown;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'grey':
      case 'gray':
        return Colors.grey;
      case 'navy':
        return Colors.indigo;
      case 'beige':
        return const Color(0xFFF5F5DC);
      default:
        return Colors.grey.shade400;
    }
  }
}
