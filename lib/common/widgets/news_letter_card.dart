import 'package:flutter/material.dart';

class NewsletterCard extends StatelessWidget {
  const NewsletterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB), // لون خلفية فاتح جداً مطابق للصورة
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. أيقونة الظرف السوداء
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.email_outlined,
              color: Colors.white,
              size: 28,
            ),
          ),
          
          const SizedBox(height: 20),

          // 2. العنوان الرئيسي
          const Text(
            "STAY UPDATED",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.black,
            ),
          ),
          
          const SizedBox(height: 12),

          // 3. النص الوصفي
          const Text(
            "SUBSCRIBE TO GET EXCLUSIVE\nDEALS AND FASHION UPDATES",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF5F6975), // لون رمادي مزرق هادئ
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 24),

          // 4. حقل إدخال الإيميل
          TextField(
            decoration: InputDecoration(
              hintText: "ENTER YOUR EMAIL",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
                letterSpacing: 1.0,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              // حدود الحقل عندما لا يكون مضغوطاً
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              // حدود الحقل عند الضغط عليه
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
          
          const SizedBox(height: 16),

          // 5. زر الاشتراك الأسود
          SizedBox(
            width: double.infinity, // الزر يأخذ العرض الكامل
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                "SUBSCRIBE",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}