import 'package:flutter/material.dart';

class PropertyAdditionalInfo extends StatelessWidget {
  const PropertyAdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // الخيارات التخرج Section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F9F3).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "خيارات التخارج",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF333333),
            ),
          ),
        ),
        const SizedBox(height: 20),

        _buildExitOption(
          title: "نافذة التخارج",
          subtitle:
              "تخارج بعد عام واحد من العقارات عن طريق بيع الأسهم في نافذة التخارج نصف السنوية لدينا",
          icon: Icons.home_outlined,
          linkText: "استكشف ميزة نوافذ التخارج",
        ),

        const SizedBox(height: 15),
        Row(
          children: [
            const Expanded(child: Divider()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F9F3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "أو",
                style: TextStyle(
                  color: Color(0xFF1ED794),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 15),

        _buildExitOption(
          title: "تخارج كامل من العقار",
          subtitle:
              "عند إجراء عملية بيع ناجحة سوف دفعة تعكس الزيادة في قيمة العقاري",
          icon: Icons.push_pin_outlined,
        ),

        const Divider(height: 40),

        // المبني Section
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "المبني",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(width: 10),
            Icon(Icons.location_on_outlined),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF1ED794).withOpacity(0.5)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "مكسة 2 دبي داوان تاون تاون",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "دبي UNITED ARAB EMIRATES",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png",
                      width: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const Divider(height: 30),
              _buildBuildingDetail(
                "عمر المبني",
                "سنوات 16",
                Icons.assignment_outlined,
              ),
              const SizedBox(height: 12),
              _buildBuildingDetail("الطوابق", "5", Icons.grid_view_outlined),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // المطور Section
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "المطور",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(width: 10),
            Icon(Icons.bar_chart_outlined),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF1ED794).withOpacity(0.5)),
          ),
          child: Column(
            children: [
              const Text(
                "EMAAR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "شركة رائدة عالمياً في تطوير العقارات، معروفة بمشاريعها الأيفونية والمجتمعات المخططة بعناية والتي تساهم في تشكيل نمط الحياة الحضرية مع التركيز على الاستدامة.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildExitOption({
    required String title,
    required String subtitle,
    required IconData icon,
    String? linkText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(width: 10),
            Icon(icon, color: Colors.black87),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 13,
            height: 1.4,
          ),
        ),
        if (linkText != null) ...[
          const SizedBox(height: 10),
          Text(
            linkText,
            style: const TextStyle(
              color: Color(0xFF1ED794),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBuildingDetail(String label, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
        const Spacer(),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F9F3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF1ED794), size: 20),
        ),
      ],
    );
  }
}
