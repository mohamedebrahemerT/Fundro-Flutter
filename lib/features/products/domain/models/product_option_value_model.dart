class ProductOptionValue {
  final int id;
  final String value;

  ProductOptionValue({required this.id, required this.value});

  // ---------- FROM JSON ----------
  factory ProductOptionValue.fromJson(Map<String, dynamic> json) {
    return ProductOptionValue(id: json["id"], value: json["value"]);
  }

  // ---------- TO JSON ----------
  Map<String, dynamic> toJson() {
    return {"id": id, "value": value};
  }
}
