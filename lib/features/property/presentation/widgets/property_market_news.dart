import 'package:flutter/material.dart';

class PropertyMarketNews extends StatelessWidget {
  const PropertyMarketNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "مؤشر سافيلز للمدن العالمية الرئيسية للسكن في النصف الأول من عام 2023",
          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14, height: 1.5),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F9F3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.mic_none_outlined, size: 16, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "في الأخبار",
                    style: TextStyle(
                      color: Color(0xFF1ED794),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        _buildNewsCard(
          title: "طلب قوي في السوق",
          content:
              "قد ترتفع العقارات في دبي بنسبة تصل إلي 12% في عام 2025 كما أدت زيادة الإيجارات إلي رفع العوائد الإجمالية إلي أعلي مستوي لها منذ سبع سنوات",
          source: "bloomberg",
        ),
        _buildNewsCard(
          title: "سوق عالي الطلب",
          content:
              "وارتفعت قيم مبيعات الوحدات السكنية في جميع أنحاء دبي بنسبة 12.3% خلال الاثني عشر شهراً الماضية وبنسبة 5.3% خلال صيف 2024",
          source: "knight frank",
        ),
        _buildFeatureCard(
          title: "بيئة ضريبية منخفضة",
          content:
              "لا توجد ضرائب عقارية أو رسوم دمغة لتقلق بشأنها مما يعني تحقيق أقصي قدر من الربح لمستثمري العقارات",
          icon: Icons.account_balance_outlined,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildNewsCard({
    required String title,
    required String content,
    required String source,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF9E9E9E),
              fontSize: 14,
              height: 1.5,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          Text(
            source,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(width: 12),
              Icon(icon, color: const Color(0xFF1ED794), size: 24),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF9E9E9E),
              fontSize: 13,
              height: 1.5,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
