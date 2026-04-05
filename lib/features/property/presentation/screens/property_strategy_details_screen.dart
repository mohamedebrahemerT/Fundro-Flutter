import 'package:flutter/material.dart';

class PropertyStrategyDetailsScreen extends StatelessWidget {
  const PropertyStrategyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF9E9E9E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "استراتيجيتنا الاستثمارية",
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "من خلال استثمارك وتنويع محفظتك، ستجمع المزيد من العقارات على لوحة التحكم الخاصة بك",
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 14,
                  height: 1.5,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 30),
            _buildStrategyCard(
              title: "نمو رأس المال",
              subtitle:
                  "إمكانية تقدير عالية بسبب اتجاهات السوق، أو البنية التحتية القادمة، أو المواقع الرئيسية.",
              icon: Icons.eco_outlined,
            ),
            _buildStrategyCard(
              title: "العوائد العالية",
              subtitle:
                  "عقارات تتميز بعوائد إيجارية أعلى من المتوسط، تهدف إلى زيادة دخل الإيجار إلى أقصى حد",
              icon: Icons.monetization_on_outlined,
            ),
            _buildStrategyCard(
              title: "محفظة متوازنة",
              subtitle:
                  "استراتيجية آمنة تجمع بين الدخل الثابت والتقدير القوي وحماية رأس المال",
              icon: Icons.balance_outlined,
            ),
            _buildStrategyCard(
              title: "تجديد وبيع العقارات",
              subtitle:
                  "شراء عقار منخفض القيمة في السوق، وتجديده، ثم إعادة بيعه بسرعة بسعر أعلى",
              icon: Icons.handyman_outlined,
            ),
            _buildStrategyCard(
              title: "التجديد - العوائد العالية",
              subtitle:
                  "تشتري العقارات منخفضة القيمة، تجددها بكفاءة لتستفيد أنت من ارتفاع قيمتها وإيرادات الإيجار القوية.",
              icon: Icons.published_with_changes_outlined,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF008955),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "تمام",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStrategyCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios, size: 16, color: Color(0xFF9E9E9E)),
          const Spacer(),
          Expanded(
            child: Column(
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
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 13,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Icon(icon, color: const Color(0xFF008955), size: 32),
        ],
      ),
    );
  }
}
