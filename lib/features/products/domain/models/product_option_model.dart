import 'package:fundro_app/features/products/domain/models/product_option_value_model.dart';

class ProductOption {
  final int id;
  final String type;
  final String name;
  final List<ProductOptionValue> values;

  ProductOption({
    required this.id,
    required this.type,
    required this.name,
    required this.values,
  });

  // ---------- FROM JSON ----------
  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      id: json["id"],
      type: json["type"],
      name: json["name"],
      values: (json["values"] as List)
          .map((e) => ProductOptionValue.fromJson(e))
          .toList(),
    );
  }

  // ---------- TO JSON ----------
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "name": name,
      "values": values.map((e) => e.toJson()).toList(),
    };
  }
}
