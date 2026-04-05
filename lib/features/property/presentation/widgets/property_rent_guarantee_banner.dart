import 'package:flutter/material.dart';

class PropertyRentGuaranteeBanner extends StatelessWidget {
  const PropertyRentGuaranteeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FBF8),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF1ED794).withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, size: 16, color: Color(0xFF9E9E9E)),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "ميزة ضمان الإيجار من فاندرو",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 2),
              Text(
                "الدفعة الأولي بتاريخ 28 فبراير 2026 FABRUARY",
                style: TextStyle(
                  color: Color(0xFF1ED794),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          const Icon(Icons.location_on, color: Color(0xFF1ED794), size: 28),
        ],
      ),
    );
  }
}
