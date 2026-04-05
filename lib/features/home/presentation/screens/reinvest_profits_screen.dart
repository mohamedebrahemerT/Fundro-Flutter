import 'package:flutter/material.dart';

class ReinvestProfitsScreen extends StatelessWidget {
  const ReinvestProfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9F1),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "تلقائي ستثمر",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              // Top Status Section
              _buildStatusIndicator(),
              const SizedBox(height: 25),
              const Text(
                "لم تصبح مؤهلاً لاستخدام خدمة إعادة استثمار الأرباح التلقائية بعد",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0EA775),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "أضف بضعة عقارات إلى محفظتك لتفعيل إعادة استثمار دخل الإيجار والمكافآت بشكل تلقائي ومضاعفة عوائدك",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 15),
              _buildProgressTarget(),
              const SizedBox(height: 30),
              // PLUS Membership Banner
              _buildPlusBanner(),
              const SizedBox(height: 30),
              // How it works
              const Text(
                "ألية العمل",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildMechanismCard(),
              const SizedBox(height: 30),
              // Benefits
              const Text(
                "مزايا الخدمة",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildBenefitItem(
                title: "مضاعفة أرباحك",
                subtitle:
                    "أعد استثمار عوائدك لنمو سريع في محفظتك والاستفادة من فوائد التراكم",
                icon: Icons.auto_graph_outlined,
              ),
              _buildBenefitItem(
                title: "النفاذ إلى مجموعة مختارة من العقارات عالية العائد",
                subtitle:
                    "احصل على فرصة الوصول إلى العقارات ذات العوائد الأعلى المختارة من استثمارات السوق بمختلف أنواع العقارات",
                icon: Icons.home_work_outlined,
              ),
              _buildBenefitItem(
                title: "استخدم خدمة إعادة استثمار سهلة",
                subtitle:
                    "بفضل واجهة التعامل السريعة التي تجعل عملية التفعيل سهلة ومبسطة جداً",
                icon: Icons.bolt_outlined,
              ),
              const SizedBox(height: 30),
              // FAQ
              const Text(
                "أسئلة وأجوبة",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildFaqItem("كيف يمكنني التأهل لخدمة إعادة استثمار الأرباح تلقائياً؟"),
              _buildFaqItem("كيف سيتم إعادة استثمار أموالي؟"),
              _buildFaqItem("متى سيتم إعادة استثمار أموالي؟"),
              _buildFaqItem("هل هناك أية رسوم؟"),
              _buildFaqItem("ما هي خدمة إعادة استثمار المكافآت؟"),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: CircularProgressIndicator(
              value: 0.3,
              strokeWidth: 4,
              color: const Color(0xFF1ED794),
              backgroundColor: Colors.grey.withOpacity(0.1),
            ),
          ),
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
            ),
            child: const Center(
              child: Text(
                "R",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1ED794),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF1ED794),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.refresh, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTarget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "إضافي لتفعيل الخدمة",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(width: 5),
          const Text(
            "11,006.50 درهم إماراتي",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0EA775),
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            "بحاجة إلى",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildPlusBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back_ios, size: 14, color: Colors.blueAccent),
          RichText(
            textAlign: TextAlign.right,
            text: const TextSpan(
              style: TextStyle(fontSize: 13, color: Colors.blueAccent),
              children: [
                TextSpan(
                  text: "للاستفادة من هذه الميزة",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: " PLUS ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "انضم إلى عضوية",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMechanismCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDE7),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFFFF59D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD54F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "ألية العمل",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "بمجرد تفعيل الخدمة، ستقوم خدمة إعادة استثمار الأرباح بمضاعفة عوائدك تلقائياً في العقار الأعلى عائداً المتاح بمجرد استلامها في رصيد محفظتك",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 13, height: 1.6, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD54F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.black87, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFFF9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFCFF3E6)),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          collapsedIconColor: Colors.black87,
          iconColor: Colors.black87,
          leading: const Icon(Icons.keyboard_arrow_down, size: 20),
          trailing: const SizedBox.shrink(), // Remove the default trailing icon
          title: Text(
            question,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0EA775),
            ),
          ),
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
