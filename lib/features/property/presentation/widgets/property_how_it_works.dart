import 'package:flutter/material.dart';

class PropertyHowItWorks extends StatelessWidget {
  const PropertyHowItWorks({super.key});

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
              Text(
                "آلية العمل",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.info_outline, size: 24, color: Color(0xFF333333)),
            ],
          ),
        ),
        _buildItem(
          title: "تملك جزءا من هذا العقار",
          subtitle: "عرض وثائق الملكية",
          icon: Icons.verified_outlined,
          hasArrow: true,
        ),
        _buildItem(
          title: "احصل علي عائد إيجاري الشهري",
          subtitle: "نحن ندير كل شيء بالنيابة عنك",
          icon: Icons.shield_outlined,
        ),
        _buildItem(
          title: "شاهد استثمارك ينمو",
          subtitle: "اكسب من ارتفاع قيمة العقار",
          icon: Icons.trending_up_outlined,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildItem({
    required String title,
    required String subtitle,
    required IconData icon,
    bool hasArrow = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          if (hasArrow)
            const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Color(0xFF9E9E9E),
            ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
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
            child: Icon(icon, color: const Color(0xFF1ED794), size: 24),
          ),
        ],
      ),
    );
  }
}
