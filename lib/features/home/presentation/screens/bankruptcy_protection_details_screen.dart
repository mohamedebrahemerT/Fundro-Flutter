import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class BankruptcyProtectionDetailsScreen extends StatelessWidget {
  const BankruptcyProtectionDetailsScreen({super.key});

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
            const Expanded(
              child: Text(
                "إذا أفلست شركة فندرو فما هي الإجراءات ...",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Main Title Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "إذا أفلست شركة فندرو فما هي الإجراءات المتبعة لحماية استثماراتك",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0EA775),
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "بواسطة MOHAMED",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              "آخر تحديث كان منذ أكثر من 11 شهر",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD144),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person, color: Colors.black, size: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Summary Box (Greenish)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFE1F5ED),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "في حالة إفلاس شركة فاندرو هناك عدة إجراءات وضمانات لحماية استثماراتك وأموالك المودعة في المنصة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF646B76),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Detail Section Cards
              _buildRefinedSectionCard(
                title: "الحماية القانونية",
                content: "شركة فاندرو مرخصة ومنظمة من قبل هيئة الأوراق المالية والسلع في دولة الإمارات العربية المتحدة. وفقاً للوائح التنظيمية، يتم الاحتفاظ بأموال العملاء في حسابات منفصلة عن أموال الشركة مما يوفر طبقة إضافية من الحماية.",
                icon: Icons.verified_user_outlined,
                iconColor: const Color(0xFF0EA775),
              ),
              _buildRefinedSectionCard(
                title: "الفصل بين الأصول",
                content: "يتم الاحتفاظ بالأوراق المالية التي تمتلكها من خلال فاندرو في حساب الحفظ الخاص بك، هذا يعني أن هذه الأصول مسجلة باسمك وليست ملكاً للشركة وبالتالي لن تكون جزءاً من أصول الشركة في حالة الإفلاس.",
                icon: Icons.description,
                iconColor: const Color(0xFFFFD144),
              ),
              _buildRefinedSectionCard(
                title: "حماية الودائع النقدية",
                content: "الأموال النقدية المودعة في حسابك محمية من خلال نظام الفصل بين حسابات العملاء وحسابات الشركة، يتم الاحتفاظ بهذه الأموال في مؤسسات مالية مرموقة ومعتمدة وتظل ملكيتها لك بالكامل.",
                icon: Icons.account_balance,
                iconColor: const Color(0xFF0EA775),
              ),

              const SizedBox(height: 10),

              // Important Note (Yellow)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFD144).withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD144),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "ملاحظة مهمة",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, fontFamily: 'Cairo'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "في حالة الإفلاس، سيتم تعيين مدير تصفية مستقل لإدارة عملية توزيع الأصول وضمان حقوق المستثمرين بالكامل وفق القانون الإماراتي.",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13, fontFamily: 'Cairo', color: Colors.black87),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Rating Feedback
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    const Text(
                      "هل هذا يجيب علي سؤالك ؟",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) => const Icon(Icons.star, size: 35, color: Color(0xFFC4C4C4))),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "اضغط كانت هذه المعلومات مفيدة ؟",
                      style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Cairo'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRefinedSectionCard({required String title, required String content, required IconData icon, required Color iconColor}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            content,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 13, color: Colors.black54, fontFamily: 'Cairo', height: 1.5),
          ),
        ],
      ),
    );
  }
}
