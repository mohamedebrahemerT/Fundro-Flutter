import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class ShariaComplianceDetailsScreen extends StatelessWidget {
  const ShariaComplianceDetailsScreen({super.key});

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
                "هل فاندرو متوافقة مع أحكام الشريعة ...",
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
                      "هل فاندرو متوافقة مع احكام الشريعة الاسلامية",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0EA775),
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 15),
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
                              "آخر تحديث كان منذ أكثر من 2 سنة",
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
              const SizedBox(height: 25),

              // License Detail Card
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "الرخصة الاسلامية",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0F2F1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.privacy_tip_outlined, color: Color(0xFF00BFA5), size: 24),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "حصلت فاندرو على رخصة النافذة الإسلامية من منظمنا الرقابي، سلطة دبي للخدمات المالية (DFSA). ومع هذه الموافقة، سمحت لنا الآن بتقديم خدمات مالية إسلامية متوافقة مع الشريعة من خلال النافذة الإسلامية، كما حصلنا على شهادة من الهيئة الإشرافية لمجموعة غايدنس المالية، وهي شركة رائدة في مجال الخدمات المالية المتخصصة في الاستثمارات والتمويل المتوافق مع الشريعة وكذلك خدمات الاستشارات الشرعية.",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 13, color: Colors.black54, fontFamily: 'Cairo', height: 1.7),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Action Buttons
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF0EA775),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "مزيد من التفصيل",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Cairo'),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E6),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFFD144).withOpacity(0.5)),
                ),
                child: const Center(
                  child: Text(
                    "تواصل مع الدعم",
                    style: TextStyle(color: Color(0xFF424242), fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Cairo'),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Rating Feedback Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    const Text(
                      "هل هذا يجيب علي سؤالك ؟",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo', color: Color(0xFF424242)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(Icons.star, size: 40, color: Color(0xFFC4C4C4)),
                      )),
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
}
