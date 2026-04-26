import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/home/presentation/screens/article_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/bankruptcy_protection_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/tax_info_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/personal_info_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/sharia_compliance_details_screen.dart';

class SecurityInfoScreen extends StatelessWidget {
  const SecurityInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9EE),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFF0EA775), size: 24),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Row(
                      children: [
                        Text(
                          "المساعدة",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF424242),
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Color(0xFF424242),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    // Large Circular Icon
                    Image.asset(Images.circle),
                    const SizedBox(height: 20),
                    // Title and Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "الأمان والتنظيمات",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00A269),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "تعرف علي البيئة التنظيمية التي نعمل فيها",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Stats Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "5 مقالات",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "MOHAMED بواسطة",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFD144),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              // shape: BoxShape.circle,
                            ),
                            child: Image.asset(Images.circlePerson),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Articles List
                    _buildArticleItem(
                      context,
                      "هل فاندرو شركة منظمة؟",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArticleDetailsScreen(
                              title: "هل فاندرو شركة منظمة؟",
                            ),
                          ),
                        );
                      },
                    ),
                    _buildArticleItem(
                      context,
                      "هل يتم فرض ضرائب علي الأستثمارات في فاندرو",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TaxInfoDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildArticleItem(
                      context,
                      "لماذا يطلب ماي بيانات ووثائق شخصية",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PersonalInfoDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildArticleItem(
                      context,
                      "إذا أفلست شركة فاندرو ... حماية استثماراتي",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BankruptcyProtectionDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildArticleItem(
                      context,
                      "هل فاندرو متوفقة مع احكام الشريعة الأسلامية ؟",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ShariaComplianceDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleItem(
    BuildContext context,
    String title, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
            const Spacer(),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD144),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(Images.docIcon),
            ),
          ],
        ),
      ),
    );
  }
}
