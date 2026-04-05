import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/home/presentation/screens/returns_mechanism_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/investment_returns_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/expected_returns_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/investment_value_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/wallet_interest_details_screen.dart';

class FinanceAndReturnsScreen extends StatelessWidget {
  const FinanceAndReturnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFFBF9F1,
      ), // Light yellowish-beige background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.search, color: Color(0xFF0EA775)),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Row(
                children: [
                  Text(
                    "المساعدة",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              // Big Icon
              Image.asset(Images.circle, width: 120, height: 120),

              // Container(
              //   width: 120,
              //   height: 120,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: const Color(0xFF0EA775).withOpacity(0.1),
              //   ),
              //   child: const Center(
              //     child: Icon(
              //       Icons.support, // Lifebuoy icon matching the photo
              //       size: 100,
              //       color: Color(0xFF0EA775),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              // Title
              const Text(
                "التمويل والعوائد",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0EA775),
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              const Text(
                "تعلم المزيد حول كيفيه عمل الاموال علي المنصة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "والعوائد المتوقعة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              // Meta info
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "5 مقالات",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "بواسطة MOHAMED",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD144),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        Images.circlePerson,
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Articles List
              _buildArticleItem(
                "الية عمل العوائد ؟",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReturnsMechanismScreen(),
                    ),
                  );
                },
              ),
               _buildArticleItem(
                "كيف ساحقق العائد علي استثماري؟",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InvestmentReturnsDetailsScreen(),
                    ),
                  );
                },
              ),
               _buildArticleItem(
                "ما هي العوائد المتوقعة الاستثماري؟",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpectedReturnsDetailsScreen(),
                    ),
                  );
                },
              ),
               _buildArticleItem(
                "كيف ساعرف قيمة استثماري ؟",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InvestmentValueDetailsScreen(),
                    ),
                  );
                },
              ),
               _buildArticleItem(
                "هل أحصل علي أي فائدة علي رصيد محفظتي\nبالدرهم الإماراتي",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WalletInterestDetailsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD144), // Yellow
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(Images.docIcon, width: 20, height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
