import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class ReturnsMechanismScreen extends StatelessWidget {
  const ReturnsMechanismScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "هل فاندرو شركة منظمة",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            Container(
              color: const Color(0xFFF6F6F6),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildHeaderCard(),
                  const SizedBox(height: 15),
                  _buildPlainCard("بمجرد الاستثمار في عقار مع فاندرو ستستفيد من نوعين من العوائد"),
                  const SizedBox(height: 15),
                  _buildNumberedCard(
                    "1",
                    "دخل الايجار",
                    "سيتم توزيع حصتك من دخل الايجار العقار علي محفظتة فاندرو الخاصة بك وتهدف إلي توزيع الأرباح علي أساس شهري",
                  ),
                  const SizedBox(height: 15),
                  _buildPlainCard("سيتم دفع أرباح إلي محفظتك و يمكنك سحبها أو إعادة استثمارها"),
                  const SizedBox(height: 15),
                  _buildNumberedCard(
                    "2",
                    "زيادة رأس المال",
                    "هذا هو المبلغ الذي تزداد بة قيمة أستثمارك بمرور الوقت علي سبيل المثال إذا اشتريت سهما بسعر 1000 درهم إمراتي فقد تبلغ قيمة 1300 درهم إمراتي عندما تقرر بيعه وهذا يتم عند التخارج من استثمارك.",
                  ),
                  const SizedBox(height: 15),
                  _buildPlainCard("يرجي ملاحظة أته يجب الاحتفاظ بجميع الاستثمارت لمدة عام واحد علي الأقل"),
                  const SizedBox(height: 15),
                  _buildFeedbackCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "الية عمل العوائد",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0EA775),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "بواسطة MOHAMED",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "اخر التحديث كان منذ أكثر من 11 شهر",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD144),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(Images.circlePerson),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlainCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFFF9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFCFF3E6)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black87,
          height: 1.6,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNumberedCard(String number, String title, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    height: 1.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFFFF9),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0EA775),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "هل هذا يجيب علي سؤالك ؟",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Icons.star,
                  color: Color(0xFF9E9E9E),
                  size: 40,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "اضغط كانت هذه المعلومات مفيدة ؟",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
