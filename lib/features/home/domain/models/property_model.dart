/// نموذج بيانات العقار
class PropertyModel {
  final String title;
  final String price;
  final String location;
  final String status;
  final String timeLeft;
  final String imagePath;

  const PropertyModel({
    required this.title,
    required this.price,
    required this.location,
    required this.status,
    required this.timeLeft,
    required this.imagePath,
  });

  /// إنشاء نموذج من JSON (للاستخدام مع الـ API لاحقاً)
  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      title: json['title'] as String,
      price: json['price'] as String,
      location: json['location'] as String,
      status: json['status'] as String,
      timeLeft: json['time_left'] as String,
      imagePath: json['image_path'] as String,
    );
  }

  /// تحويل النموذج إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'location': location,
      'status': status,
      'time_left': timeLeft,
      'image_path': imagePath,
    };
  }

  /// نسخ النموذج مع تعديل بعض الحقول
  PropertyModel copyWith({
    String? title,
    String? price,
    String? location,
    String? status,
    String? timeLeft,
    String? imagePath,
  }) {
    return PropertyModel(
      title: title ?? this.title,
      price: price ?? this.price,
      location: location ?? this.location,
      status: status ?? this.status,
      timeLeft: timeLeft ?? this.timeLeft,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
