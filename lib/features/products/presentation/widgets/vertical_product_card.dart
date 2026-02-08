import 'package:fundro_app/common/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';

class VerticalProductCard extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String title;
  final String price;
  final bool isNew; // متغير لتحديد هل نعرض علامة NEW أم لا

  const VerticalProductCard({
    super.key,
    required this.imageUrl,
    required this.brand,
    required this.title,
    required this.price,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // عرض الكارد (يمكنك تغييره أو جعله مرن)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النصوص لليسار
        children: [
          // 1. قسم الصورة والعلامة
          Stack(
            children: [
              // الصورة الأساسية
              CustomCachedImage(
                imageUrl: imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                borderRadius: 16,
              ),

              // علامة NEW (تظهر فقط إذا كانت isNew = true)
              if (isNew)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "NEW",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12), // مسافة بين الصورة والنصوص
          // 2. اسم البراند (BURBERRY)
          Text(
            brand.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF6B7280), // لون رمادي مزرق قليلاً
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),

          const SizedBox(height: 4),

          // 3. اسم المنتج (CLASSIC TRENCH)
          Text(
            title.toUpperCase(),
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              // fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 4),

          // 4. السعر ($1290)
          Text(
            price,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
