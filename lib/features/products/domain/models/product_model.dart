import 'package:fundro_app/features/products/domain/models/product_option_model.dart';
import 'package:fundro_app/features/products/domain/models/product_variant_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String? slug;
  final String? sku;
  final double price;
  final int quantity;
  final bool inStock;
  final String image;
  final bool isActive;
  final bool isFeatured;
  final String status;
  final bool hasVariants;
  final List<ProductOption> options;
  final List<ProductVariant> variants;
  final String createdAt;
  final String updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    this.slug,
    this.sku,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.image,
    required this.isActive,
    required this.isFeatured,
    required this.status,
    required this.hasVariants,
    required this.options,
    required this.variants,
    required this.createdAt,
    required this.updatedAt,
  });

  // ---------- FROM JSON ----------
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      description: json["description"] ?? "",
      slug: json["slug"],
      sku: json["sku"],
      price: (json["price"] as num).toDouble(),
      quantity: json["quantity"] ?? 0,
      inStock: json["in_stock"] ?? false,
      image: json["image"] ?? "",
      isActive: json["is_active"] ?? false,
      isFeatured: json["is_featured"] ?? false,
      status: json["status"] ?? "pending",
      hasVariants: json["has_variants"] ?? false,
      options:
          (json["options"] as List<dynamic>?)
              ?.map((e) => ProductOption.fromJson(e))
              .toList() ??
          [],
      variants:
          (json["variants"] as List<dynamic>?)
              ?.map((e) => ProductVariant.fromJson(e))
              .toList() ??
          [],
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
    );
  }

  // ---------- TO JSON ----------
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "slug": slug,
      "sku": sku,
      "price": price,
      "quantity": quantity,
      "in_stock": inStock,
      "image": image,
      "is_active": isActive,
      "is_featured": isFeatured,
      "status": status,
      "has_variants": hasVariants,
      "options": options.map((e) => e.toJson()).toList(),
      "variants": variants.map((e) => e.toJson()).toList(),
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
