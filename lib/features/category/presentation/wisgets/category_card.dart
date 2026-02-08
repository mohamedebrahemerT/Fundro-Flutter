import 'package:fundro_app/common/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // 1. تحديد ارتفاع وحواف الكونتينر الخارجي
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB), // لون الخلفية الفاتح جداً
        borderRadius: BorderRadius.circular(24), // حواف دائرية للبطاقة
      ),
      // 2. استخدام Material و InkWell لعمل تأثير الضغط
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24), // لقص تأثير الضغط مع الحواف
          onTap: onTap, // دالة الضغط
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // 3. الصورة مع حواف دائرية
                CustomCachedImage(
                  imageUrl: imageUrl,
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                  borderRadius: 16,
                ),

                const SizedBox(width: 20), // مسافة بين الصورة والنص
                // 4. النص
                Text(
                  title.toUpperCase(), // تحويل النص لأحرف كبيرة
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2, // تباعد بسيط بين الأحرف
                    color: Colors.black87,
                    fontFamily: 'Arial', // يمكنك تغيير الخط هنا
                  ),
                ),

                const Spacer(), // يدفع الأيقونة لأقصى اليمين
                // 5. أيقونة السهم
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                  size: 20,
                ),

                const SizedBox(width: 8), // مسافة بسيطة من الحافة اليمنى
              ],
            ),
          ),
        ),
      ),
    );
  }
}
