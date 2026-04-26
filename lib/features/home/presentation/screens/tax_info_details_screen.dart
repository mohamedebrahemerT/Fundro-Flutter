import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class TaxInfoDetailsScreen extends StatelessWidget {
  const TaxInfoDetailsScreen({super.key});

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
                "هل يتم فرض ضرائب علي الأستثمارات ...",
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
              // Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "هل يتم فرض ضرائب علي الاستثمارات في فاندرو",
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
                              "بقلم MOHAMED",
                              style: TextStyle(fontSize: 13, color: Colors.grey, fontFamily: 'Cairo'),
                            ),
                            Text(
                              "آخر تحديث كان منذ أكثر من 11 شهر",
                              style: TextStyle(fontSize: 11, color: Colors.grey, fontFamily: 'Cairo'),
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

              // Summary Highlight (Green with Info Icon)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE1F5ED),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(
                      child: Text(
                        "لا يتم فرض ضرائب على الاستثمارات في فاندرو، ولكن قد تخضع أرباحك لضريبة. تعرف على المزيد حول كيفية حماية استثماراتك.",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12, color: Color(0xFF424242), fontFamily: 'Cairo'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.info_outline, color: Color(0xFF0EA775), size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Detail Section Cards
              _buildInfoCard(
                title: "الضرائب علي الاستثمار",
                content: "الاستثمارات في فاندرو نفسها لا تخضع للضريبة. ومع ذلك عندما تحقق أرباحاً من هذه الاستثمارات، قد تكون هذه الأرباح خاضعة لضريبة أرباح رأس المال حسب قوانين بلدك. من المهم أن تستشير مستشاراً ضريبياً لفهم التزاماتك الضريبية بشكل كامل.",
                icon: Icons.verified_user_outlined,
                iconColor: const Color(0xFF1ED794),
              ),
              _buildInfoCard(
                title: "التقارير الضريبية",
                content: "توفر فاندرو تقارير مفصلة لجميع معاملاتك الاستثمارية مما يسهل عليك إعداد إقراراتك الضريبية. يمكنك تحميل هذه التقارير في أي وقت من حسابك وهي متوافقة مع متطلبات معظم الهيئات الضريبية.",
                icon: Icons.description,
                iconColor: const Color(0xFFFFD144),
              ),
              _buildInfoCard(
                title: "حماية الاستثمارات في حالة الإفلاس",
                content: "في حالة إفلاس فاندرو، فإن استثماراتك محمية بموجب القانون. الأصول التي تمتلكها من خلال فاندرو يتم الاحتفاظ بها في حسابات منفصلة ولا تعتبر جزءاً من أصول الشركة. هذا يعني أن أموالك محمية ويمكن إعادتها إليك.",
                icon: Icons.account_balance,
                iconColor: const Color(0xFF0EA775),
              ),

              const SizedBox(height: 10),

              // Warning Box (Yellow)
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "تنبيه مهم",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'Cairo'),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.warning_amber_rounded, color: Color(0xFFFFD144), size: 18),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "هذه المعلومات ذات طبيعة عامة ولا تشكل نصيحة ضريبية. نوصي بشدة بالتشاور مع مستشار ضريبي مؤهل لفهم وضعك الخاص.",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12, fontFamily: 'Cairo', color: Colors.black87, height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Disclaimer Card
              _buildInfoCard(
                title: "إخلاء المسؤولية",
                content: "المعلومات الواردة في هذا المقال هي لأغراض تعليمية فقط ولا تشكل نصيحة مالية أو ضريبية أو قانونية. الأوضاع الضريبية تختلف من شخص لآخر ومن بلد لآخر. يجب عليك دائماً استشارة مستشار مالي.",
                icon: Icons.help_outline,
                iconColor: const Color(0xFF00ACC1),
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) => const Icon(Icons.star, size: 35, color: Color(0xFFC4C4C4))),
                    ),
                    const SizedBox(height: 20),
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

  Widget _buildInfoCard({required String title, required String content, required IconData icon, required Color iconColor}) {
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
