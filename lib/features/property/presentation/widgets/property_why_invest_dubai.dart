import 'package:flutter/material.dart';

class PropertyWhyInvestDubai extends StatelessWidget {
  const PropertyWhyInvestDubai({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  "لماذا يعد الاستثمار في دبي أمرا مهما ولماذا الآن؟",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF333333),
                    height: 1.3,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(width: 12),
              Icon(
                Icons.rocket_launch_outlined,
                size: 24,
                color: Color(0xFF333333),
              ),
            ],
          ),
        ),
        _buildInfoItem(
          text: "قطاع العقارات في دبي يقود اتجاهات المو العالية سافيلز",
          icon: Icons.public,
        ),
        const SizedBox(height: 15),
        _buildGrowthItem(),
        const SizedBox(height: 15),
        _buildLinkItem(),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildInfoItem({required String text, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                height: 1.4,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F9F3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1ED794), size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildGrowthItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+5%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF333333),
                ),
              ),
              Text(
                "متوسط نمو قيمة العقارات العالمية",
                style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F9F3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png",
                width: 28,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, size: 16, color: Color(0xFF1ED794)),
          const Spacer(),
          const Text(
            "عرض التفاصيل العالمية",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(width: 15),
          const Icon(Icons.public, color: Color(0xFF1ED794), size: 24),
        ],
      ),
    );
  }
}
