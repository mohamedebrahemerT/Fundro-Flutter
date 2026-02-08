class ProductImageModel {
  final int id;
  final String image;

  ProductImageModel({
    required this.id,
    required this.image,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json["id"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
    };
  }
}
