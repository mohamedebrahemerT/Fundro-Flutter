import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class AutoInvestScreen extends StatelessWidget {
  const AutoInvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9F1),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.search, color: Color(0xFF0EA775)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // Header Icon & Text
            const Icon(Icons.bolt, size: 80, color: Color(0xFF1ED794)),
            const SizedBox(height: 20),
            const Text(
              "لم يتم تفعيل الاستثمار التلقائي",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0EA775),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "فعل هذه الميزة وقم ببناء محفظة استثمارية متنوعة سريعة ومبسطة جداً",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
              ),
            ),
            const SizedBox(height: 25),
            // Activation Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "فعل خدمات الاستثمار التلقائي",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Benefits Section
            _buildSectionHeader("مزايا الخدمة"),
            const SizedBox(height: 15),
            _buildBenefitItem(
              title: "فقط القيمة التى تريح اموالك لنمو سريع",
              subtitle:
                  "أعد استثمار عوائدك لنمو سريع في محفظتك والاستفادة من فوائد التراكم",
              icon: Icons.description_outlined,
            ),
            _buildBenefitItem(
              title: "ادخر من اقل من 500 درهم إماراتي شهرياً",
              subtitle: "بسهولة بناء ثروتك بمبالغ صغيرة ومستمرة شهرياً",
              icon: Icons.description_outlined,
            ),
            _buildBenefitItem(
              title: "تنوع استثماراتك تلقائياً",
              subtitle: "خلق محفظة استثمارية متوازنة في سوق العقارات العالمي",
              icon: Icons.description_outlined,
            ),
            const SizedBox(height: 30),
            // Mechanism Section
            _buildSectionHeader("ألية العمل"),
            const SizedBox(height: 15),
            _buildStepItem(
              "1",
              "حدد المبلغ",
              "اختر المبلغ الذى ترغب فى استثماره شهرياً",
            ),
            _buildStepItem(
              "2",
              "اختر موعد استثمار تلقائي",
              "اختر التاريخ المفضل لسحب المبلغ تلقائياً كل شهر",
            ),
            _buildStepItem(
              "3",
              "والفاندرو ستفعل كل شئ بمفردها",
              "ماتحتاج تسوي شي، سنقوم بكل العمل بدلاً عنك",
            ),
            _buildStepItem(
              "4",
              "أرتاح وشاهد محفظتك تنمو",
              "تابع نمو استثماراتك وتنوعها مع مرور الوقت",
            ),
            const SizedBox(height: 30),
            // FAQ Section
            _buildSectionHeader("أسئلة وأجوبة"),
            const SizedBox(height: 15),
            _buildFaqItem("ألية العمل"),
            _buildFaqItem(
              "هل يمكننى إيقاف الاستثمار التلقائى مؤقتاً أو إلغاؤه",
            ),
            _buildFaqItem(
              "هل يمكننى إجراء تغييرات على خطة الاستثمار التلقائى الخاصة بي؟",
            ),
            _buildFaqItem("هل هناك أية رسوم؟"),
            _buildFaqItem("متى سيتم خصم الأموال من محافظتى؟"),
            _buildFaqItem(
              "ماذا يحدث إذا لم تتوافق الاستثمارات المتوفرة مع نموذج الاستثمار التلقائى الخاص بي؟",
            ),
            _buildFaqItem("هل سيتحدد مدى إستثمار أرباحي؟"),
            const SizedBox(height: 40),
            // Footer Section
            _buildFooter(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildBenefitItem({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF0EA775),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD54F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.black87, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(String number, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFFFF9),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          number,
                          style: const TextStyle(
                            color: Color(0xFF0EA775),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFFF9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0EA775),
          ),
        ),
        leading: const Icon(Icons.keyboard_arrow_down, color: Colors.black87),
        trailing: const SizedBox.shrink(),
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
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            "المستثمرون الذين يستخدمون بشكل منتظم يكسبون 3 عوائد سنوياً",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Images.logo),
              // const SizedBox(width: 15),
              // Column(
              //   children: [
              //     Icon(Icons.keyboard_arrow_up, color: const Color(0xFF1ED794).withOpacity(0.3), size: 40),
              //     const Icon(Icons.keyboard_arrow_up, color: Color(0xFF1ED794), size: 40),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
