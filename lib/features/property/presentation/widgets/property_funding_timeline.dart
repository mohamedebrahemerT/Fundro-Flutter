import 'package:flutter/material.dart';

class PropertyFundingTimeline extends StatelessWidget {
  const PropertyFundingTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF1ED794).withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "الجدول الزمني للتمويل",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(width: 12),
              Icon(
                Icons.grid_view_outlined,
                color: Color(0xFF333333),
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F9F3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "الجدول الزمني هو مجرد تقدير وقد تختلف التواريخ الفعلية",
              style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 25),
          _buildItem(
            title: "تم الانتهاء من تمويل العقار",
            date: "December 1, 2025",
            subtitle: "تم تمويل العقار بالكامل من قبل المستثمرين",
          ),
          const Divider(height: 40, color: Color(0xFFEEEEEE)),
          _buildItem(
            title: "تم إصدار سندات الملكية",
            date: "December 15, 2025",
            subtitle:
                "سيتم إصدار شهادات ملكية الحصص للعقارات الخاصة بك بعد أسبوعين من تمويل العقار",
          ),
          const Divider(height: 40, color: Color(0xFFEEEEEE)),
          _buildItem(
            title: "أول دفعة إيجار",
            date: "JANUARY 31, 2026",
            subtitle:
                "نتوقع أن تتم الدفعة الإيجارية الأولى بحول 31 يناير 2026 مع تاريخ دفع مضمون لا يتجاوز 28 فبراير 2026",
            badge: "مضمون يحول 28 فبراير 2026",
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String title,
    required String date,
    required String subtitle,
    String? badge,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
        ),
        const SizedBox(height: 8),
        if (badge != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F9F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Color(0xFF1ED794),
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  badge,
                  style: const TextStyle(
                    color: Color(0xFF1ED794),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF9E9E9E),
            fontSize: 13,
            height: 1.5,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
