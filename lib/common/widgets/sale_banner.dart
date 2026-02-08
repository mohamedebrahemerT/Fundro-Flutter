import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width * 0.9,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4A4A4A),
            Color(0xFF8E8E8E), // رمادي فاتح
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // محاذاة المحتوى لليسار
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. العنوان الرئيسي
          const Text(
            "EXCLUSIVE WINTER SALE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 12),

          // 2. الوصف الفرعي
          Text(
            "Save big on premium fashion brands",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 24),

          // 3. عرض نسب الخصم (50%, 40%, 30%)
          Row(
            children: [
              _buildDiscountText("50%", "OFF"),
              const SizedBox(width: 20),
              _buildDiscountText("40%", "OFF"),
              const SizedBox(width: 20),
              _buildDiscountText("30%", "OFF"),
            ],
          ),

          const SizedBox(height: 24),

          // 4. زر Discover Deals
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              "DISCOVER DEALS",
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.0),
            ),
          ),
        ],
      ),
    );
  }

  // Widget مساعد لرسم نصوص الخصم بشكل منسق
  Widget _buildDiscountText(String percentage, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          percentage,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
