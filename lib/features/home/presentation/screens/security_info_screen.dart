import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class SecurityInfoScreen extends StatelessWidget {
  const SecurityInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.arrow_back_ios, size: 18, color: Colors.grey),
            const Spacer(),
            const Expanded(
              child: Text(
                "إذا أفلست شركة فندرو فما هي الإجراءات المتبعة لحماية استثماراتك",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Cairo',
                ),
              ),
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
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
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
                              "MOHAMED بواسطة",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "آخر تحديث كان منذ أكثر من 11 شهر",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD144),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            Images.circlePerson,
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Summary Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFE1F5ED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "في حالة إفلاس شركة فندرو هناك عدة إجراءات وضمانات لحماية استثماراتك وأموالك المودعة في المنصة",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF646B76),
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Detail Cards
              _buildDetailCard(
                title: "الحماية القانونية",
                content:
                    "شركة فندرو مرخصة ومنظمة من قبل هيئة الأوراق المالية والسلع في دولة الإمارات العربية المتحدة. وفقاً للوائح التنظيمية، يتم الاحتفاظ بأموال العملاء في حسابات منفصلة عن أموال الشركة، مما يوفر طبقة إضافية من الحماية.",
                image: Images.protect,
              ),
              _buildDetailCard(
                title: "الفصل بين الأصول",
                content:
                    "يتم الاحتفاظ بالأوراق المالية التي تمتلكها من خلال مشروع في حساب الحفظ الخاص بك، هذا يعني أن هذه الأصول مسجلة باسمك وليست ملكاً للشركة وبالتالي لن تكون جزءاً من أصول الشركة في حالة الإفلاس.",
                image: Images.statistics,
              ),
              _buildDetailCard(
                title: "حماية الودائع النقدية",
                content:
                    "الأموال النقدية المودعة في حسابك محمية من خلال نظام الفصل بين حسابات العملاء وحسابات الشركة. يتم الاحتفاظ بهذه الأموال في مؤسسات مالية مرموقة ومعتمدة وتظل ملكيتها لك بالكامل.",
                image: Images.payMoney,
              ),

              const SizedBox(height: 10),

              // Important Note
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFFFD144).withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD144),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "ملاحظة مهمة",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "في حالة الإفلاس، سيتم تعيين مدير إفلاس مستقل لإدارة عملية توزيع الأصول واستمرار أموال العملاء. عادة ما تكون المطالبون بالأسماء ذات أهمية على الدائنين الآخرين.",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Rating Section
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border, size: 40, color: Colors.grey),
                        Icon(Icons.star_border, size: 40, color: Colors.grey),
                        Icon(Icons.star_border, size: 40, color: Colors.grey),
                        Icon(Icons.star_border, size: 40, color: Colors.grey),
                        Icon(Icons.star_border, size: 40, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "اضغط كانت هذه المعلومات مفيدة ؟",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Cairo',
                      ),
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

  Widget _buildDetailCard({
    required String title,
    required String content,
    required String image,
  }) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FAF6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(image, height: 25, width: 25),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            content,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontFamily: 'Cairo',
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
