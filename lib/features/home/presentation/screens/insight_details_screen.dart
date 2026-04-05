import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class InsightDetailsScreen extends StatelessWidget {
  final String title;

  const InsightDetailsScreen({super.key, required this.title});

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
              color: const Color(
                0xFFF6F6F6,
              ), // Light grey background like in image
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildHeaderCard(),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    "توزيع سندات الملكية: سيتلقى جميع المستثمرين سندات الملكية في غضون بضعة أسابيع من إغلاق التمويل كدليل على ملكيتهم للعقار.",
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    "سيتم إصدار سندات الملكية من قبل دائرة الأراضي والأملاك في دبي وستنشأ شركة ذات غرض خاص",
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    "وسيتم إصدار شهادة ملكية الحصص من قبل ستابك وستثبت ملكيتك في الشركة ذات الغرض الخاص بالعقار.",
                  ),
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
            "متي يمكنني إستلام\nمستنداتي؟",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0EA775),
              height: 1.3,
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
                  color: const Color(0xFFFFD144), // Yellow background
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.black87, width: 1.5),
                ),
                child: Image.asset(Images.circlePerson),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFFF9), // Very light green
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
          fontWeight: FontWeight.w500,
        ),
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
                  color: Color(0xFF9E9E9E), // Grey color like in image
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
