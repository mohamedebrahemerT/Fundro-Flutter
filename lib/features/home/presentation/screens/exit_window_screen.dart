import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/exit_window_feature_item.dart';

class ExitWindowScreen extends StatelessWidget {
  const ExitWindowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF0F4F1,
      ), // Light mint green matched from image
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "نافذة التخارج متوفرة الآن",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "استفد من نافذة التخارج وفرص البيع والشراء",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // Middle Icon and Title
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 6),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF006D44),
                            width: 3.5,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.apartment,
                        size: 75,
                        color: Color(0xFF006D44),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "نافذة التخارج",
                      style: TextStyle(
                        color: Color(0xFF1ED794),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "اشتر قوائم ثانوية",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // List of Features
              ExitWindowFeatureItem(
                title: "استثمر بسعر مخفض",
                subtitle:
                    "استفد من أسعار تنافسية للعقارات بخصومات تصل إلى 20% على القيمة السوقية الحالية مقارنة بسعر العرض الأصلي صرف على تطبيق سكني",
                iconWidget: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD54F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.trending_up,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
              ExitWindowFeatureItem(
                title: "إمكانات ربح أعلى",
                subtitle:
                    "استفد من عوائد الإيجار الجذابة المحتملة وارتفاع قيمة رأس المال مقارنة بالعقار المشارك بسعر السوق العادي",
                iconWidget: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD54F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.leaderboard_outlined,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
              ExitWindowFeatureItem(
                title: "خفض تكلفة الاستثمار الخاص بك",
                subtitle:
                    "قم بشراء الأسهم بسعر مخفض في عقارات تمتلكها لخفض أساس التكلفة وزيادة عوائدك",
                iconWidget: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD54F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.request_quote_outlined,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ExitWindowFeatureItem(
                title: "هل تريد بيع حصتك ؟",
                titleColor: const Color(0xFFFF4B4B), // Red accent
                iconWidget: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black87, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.business,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
