class VariantOptionValue {
  final int optionId;
  final String optionNameEn;
  final String optionNameAr;
  final int valueId;
  final String value;

  VariantOptionValue({
    required this.optionId,
    required this.optionNameEn,
    required this.optionNameAr,
    required this.valueId,
    required this.value,
  });

  // ---------- FROM JSON ----------
  factory VariantOptionValue.fromJson(Map<String, dynamic> json) {
    return VariantOptionValue(
      optionId: json["option_id"],
      optionNameEn: json["option_name_en"],
      optionNameAr: json["option_name_ar"],
      valueId: json["value_id"],
      value: json["value"],
    );
  }

  // ---------- TO JSON ----------
  Map<String, dynamic> toJson() {
    return {
      "option_id": optionId,
      "option_name_en": optionNameEn,
      "option_name_ar": optionNameAr,
      "value_id": valueId,
      "value": value,
    };
  }
}
