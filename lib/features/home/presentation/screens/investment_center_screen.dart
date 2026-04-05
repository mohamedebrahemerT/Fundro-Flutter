import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/investment_custom_card.dart';

class InvestmentCenterScreen extends StatelessWidget {
  const InvestmentCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF4F8F3,
      ), // Color close to the background in image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
            const Text(
              "مركز الاستثمار",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              InvestmentCustomCard(
                title: "أنت في الصناديق",
                backgroundColor: const Color(0xFFE5E7E9), // Light grey
                textColor: Colors.black87,
                rightIcon: Icons.apartment,
                iconColor: const Color(0xFF1ED794),
              ),
              InvestmentCustomCard(
                title: "العقارات",
                leftText: "حصص العقارات",
                leftIcon: Icons.arrow_back_ios,
                backgroundColor: const Color(
                  0xFF1ED794,
                ), // Green from the design
                textColor: Colors.white,
                rightIcon: Icons.apartment,
                iconColor: Colors.white,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "استكشيف المزيد من المنتجات",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.trending_up, color: Colors.black87),
                ],
              ),
              const SizedBox(height: 15),
              InvestmentCustomCard(
                title: "امتلك بالكامل مع فاندرو",
                subtitle: "قم بشراء و إدارة وبيع عقارات كاملة",
                leftIcon: Icons.arrow_back_ios,
                backgroundColor: const Color(0xFF1A2539), // Dark blue
                textColor: Colors.white,
                subtitleColor: Colors.grey[400],
              ),
              const SizedBox(height: 40),
              InvestmentCustomCard(
                title: "تم إطلاق الصندوق الأمريكي",
                subtitle: "اطلع علي تفاصيل الصندوق والعوائد المحتملة",
                leftIcon: Icons.arrow_back_ios,
                backgroundColor: Colors.transparent,
                textColor: Colors.black87,
                subtitleColor: Colors.grey[600],
                hasBorder: true,
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "مرخصة من قبل هيئة دبي للخدمات المالية وهيئة السوق المالية",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
