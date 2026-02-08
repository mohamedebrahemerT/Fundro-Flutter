import 'package:fundro_app/features/products/domain/models/variant_option_value_model.dart';

class ProductVariant {
  final int id;
  final String sku;
  final String price;
  final int quantity;
  final List<VariantOptionValue> optionValues;
  final String name;
  final String? image;

  ProductVariant({
    required this.id,
    required this.sku,
    required this.price,
    required this.quantity,
    required this.optionValues,
    required this.name,
    this.image,
  });

  // ---------- FROM JSON ----------
  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json["id"],
      sku: json["sku"],
      price: json["price"].toString(),
      quantity: json["quantity"],
      optionValues: (json["option_values"] as List)
          .map((e) => VariantOptionValue.fromJson(e))
          .toList(),
      name: json["name"],
      image: json["image"],
    );
  }

  // ---------- TO JSON ----------
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sku": sku,
      "price": price,
      "quantity": quantity,
      "option_values": optionValues.map((e) => e.toJson()).toList(),
      "name": name,
      "image": image,
    };
  }
}
