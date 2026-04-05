import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/insight_banner_widget.dart';
import 'package:fundro_app/features/home/presentation/screens/insight_details_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/finance_and_returns_screen.dart';

class InsightBannersScroll extends StatelessWidget {
  const InsightBannersScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true, // For RTL feel
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: [
          InsightBannerWidget(
            title: "تعرف على عمليات الإيداع\nوالسحب",
            color: const Color(0xFF008955),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InsightDetailsScreen(
                    title: "تعرف على عمليات الإيداع\nوالسحب",
                  ),
                ),
              );
            },
          ),
          InsightBannerWidget(
            title: "كيف تحمي بياناتك\nللخدمات المالية",
            color: const Color(0xFF008955),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FinanceAndReturnsScreen(),
                ),
              );
            },
          ),
          InsightBannerWidget(
            title: "نصائح لاستثمار\nعقاري ناجح",
            color: const Color(0xFF008955),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InsightDetailsScreen(
                    title: "نصائح لاستثمار\nعقاري ناجح",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }




}
