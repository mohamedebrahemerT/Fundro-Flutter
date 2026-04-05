import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class InvestmentReturnsDetailsScreen extends StatelessWidget {
  const InvestmentReturnsDetailsScreen({super.key});

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
              "كيف ساحقق العائد علي استثماري؟",
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                children: [
                  _buildHeaderCard(),
                  const SizedBox(height: 15),
                  _buildMainReturnsCard(),
                  const SizedBox(height: 15),
                  _buildNoteCard(),
                  const SizedBox(height: 15),
                  _buildShieldCard(
                    "بعد استلام أرباحك ستظهر الأموال في رصيد المتاح في محفظتك فاندرو يمكنك حينها السحب المبلغ إلى حسابك البنكي المسجل أو إعادة استثمارها في عقار آخر على فاندرو لتنمية محفظتك الاستثمارية",
                  ),
                  const SizedBox(height: 15),
                  _buildShieldCardWithTitle(
                    "ماذا حدث عن انتهاء مدة الاستثمار؟",
                    "عند انتهاء مدة الاستثمار، سيتم بيع العقار وتوزيع حصتك من عائدات البيع بعد خصم جميع تكاليف المعاملة ذات الصلة، وذلك وفقاً لنسبة ملكيتك في الشركة ذات الغرض الخاص (SPV) عند هذه المرحلة يعتبر استثمارك قد تم استرداده سواء بربح أو خسارة، وسيتم إغلاق",
                  ),
                  const SizedBox(height: 20),
                  _buildFeedbackCard(),
                  const SizedBox(height: 20),
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "كيف سأحقق العائد علي استثماري؟",
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

  Widget _buildMainReturnsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFFF9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFCFF3E6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "يتم توزيع حصتك من الدخل الإيجاري للعقار مباشرة إلى محفظة فاندرو الخاصة بك، ونسعى للتوزيع الأرباح بشكل شهري. يتم احتساب صافي التوزيعات بعد خصم جميع التكاليف المرتبطة بالعقار، والتي تشمل:",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black87,
              height: 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          _buildListItem("رسوم الخدمات"),
          _buildListItem("رسوم إدارة العقار"),
          _buildListItem("الرسوم الإدارية السنوية لفاندرو"),
          _buildListItem("تكاليف الصيانة"),
          _buildListItem("التأمين"),
          _buildListItem("أي تكاليف أخرى مرتبطة بالشركة ذات الغرض الخاص (SPV)"),
        ],
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black54,
          height: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNoteCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FEF9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2F9F0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "قد يختلف مبلغ التوزيعات الشهرية حسب احتياجات الصيانة ونسبة الإشغال في العقار",
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF0EA775),
                height: 1.6,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7E0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.description_outlined,
                color: Color(0xFFFFD144), size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildShieldCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
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
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFEFFFF9),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.verified_user_outlined,
                color: Color(0xFF0EA775), size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildShieldCardWithTitle(String title, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFFFF9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.verified_user_outlined,
                    color: Color(0xFF0EA775), size: 20),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
    );
  }

  Widget _buildFeedbackCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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
                  color: Color(0xFFC0C0C0),
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
