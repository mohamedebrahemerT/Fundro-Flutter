import 'package:flutter/material.dart';
import 'property_strategy_item.dart';
import '../screens/property_strategy_details_screen.dart';

class PropertyInvestmentStrategy extends StatelessWidget {
  const PropertyInvestmentStrategy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "استراتيجية الاستثمار",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.bolt_outlined, size: 24, color: Color(0xFF333333)),
            ],
          ),
        ),
        const Text(
          "محفظة متوازنة",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF333333),
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        const Text(
          "استراتيجية آمنة تجمع بين الدخل الثابت التقدير القوي وحماية رأس المال",
          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14, height: 1.5),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 25),
        PropertyStrategyItem(
          title: "مطور عقاري موثوق",
          subtitle:
              "تم إنشاء المشروع بواسطة إحدى أبرز شركات التطوير العقاري الموثوقين في دبي",
          icon: Icons.business_outlined,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PropertyStrategyDetailsScreen(),
              ),
            );
          },
          child: const PropertyStrategyItem(
            title: "موقع مركزي",
            subtitle:
                "موقع مركز بالمنطقة وقرب جداً من أبرز المراكز التجارية سيراً علي الاقدام",
            icon: Icons.trending_up,
          ),
        ),
        const SizedBox(height: 10),
        _buildLinkItem(),
        const SizedBox(height: 20),
      ],
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
            "تعرف علي استراتيجيات الاستثمار",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(width: 15),
          const Icon(Icons.bolt_outlined, color: Color(0xFF1ED794), size: 24),
        ],
      ),
    );
  }
}
