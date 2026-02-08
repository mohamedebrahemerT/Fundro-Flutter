import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String brandName;
  final String productName;
  final String price;
  final VoidCallback onQuickViewTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.brandName,
    required this.productName,
    required this.price,
    required this.onQuickViewTap,
  });

  @override
  Widget build(BuildContext context) {
    // تحديد عرض وارتفاع الكارد (يمكنك إزالته ليتمدد حسب الأب)
    return Container(
      width: 320,
      height: 480,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        // ظل خفيف للكارد بالكامل (اختياري)
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // 1. صورة الخلفية (تأخذ المساحة كاملة)
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[300]), // في حال فشل الصورة
              ),
            ),
            //   child: Image.network(
            //     imageUrl,
            //     fit: BoxFit.cover,
            //     errorBuilder: (context, error, stackTrace) =>
            //         Container(color: Colors.grey[300]), // في حال فشل الصورة
            //   ),
            // ),

            // 2. الكارد الأبيض العائم في الأسفل
            Positioned(
              bottom: 16, // مسافة من الأسفل
              left: 16, // مسافة من اليسار
              right: 16, // مسافة من اليمين
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // النصوص (يسار)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // اسم البراند
                          Text(
                            brandName.toUpperCase(),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // اسم المنتج
                          Text(
                            productName.toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // السعر
                          Text(
                            price,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // زر Quick View (يمين)
                    InkWell(
                      onTap: onQuickViewTap,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "QUICK VIEW",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
