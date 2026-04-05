import 'package:flutter/material.dart';
import 'package:fundro_app/features/on_boarding/presentation/widgets/custom_onboarding_button.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_features_grid.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_funding_banner.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_funding_stats.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_financial_details.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_how_it_works.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_investment_strategy.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_investment_calculator.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_why_invest_dubai.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_market_news.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_rental_strategy.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_financial_breakdown.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_funding_timeline.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_additional_info.dart';
import 'package:fundro_app/features/property/presentation/widgets/property_rent_guarantee_banner.dart';
import '../screens/property_cart_screen.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // 1. معرض الصور (Image Gallery)
                _buildImageHeader(context),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "فيلا من أربع غرف نوم واحدة في مسكة 2، دبي داون تاون",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // 2. سكشن تفاصيل العقار (Icons Grid)
                      _buildFeaturesSection(),

                      // 3. بانر التمويل (Funding Banner)
                      const PropertyFundingBanner(),

                      // 4. إحصائيات التمويل (Funding Stats)
                      const PropertyFundingStats(),

                      // 5. التفاصيل المالية (Financial Details)
                      const PropertyFinancialDetails(),

                      // 6. آلية العمل (How it Works)
                      const PropertyHowItWorks(),

                      // 7. استراتيجية الاستثمار (Investment Strategy)
                      const PropertyInvestmentStrategy(),

                      // 8. حاسبة الاستثمار (Investment Calculator)
                      const PropertyInvestmentCalculator(),

                      // 9. لماذا الاستثمار في دبي (Why Dubai)
                      const PropertyWhyInvestDubai(),

                      // 10. أخبار السوق (Market News)
                      const PropertyMarketNews(),

                      // 11. استراتيجية تأجير العقار (Rental Strategy)
                      const PropertyRentalStrategy(),

                      // 12. التفاصيل المالية المفصلة (Financial Breakdown)
                      const PropertyFinancialBreakdown(),

                      // 13. الجدول الزمني للتمويل (Timeline)
                      const PropertyFundingTimeline(),

                      // 14. معلومات إضافية (Exit options, Building, Developer)
                      const PropertyAdditionalInfo(),

                      // 15. ميزة ضمان الإيجار (Rent Guarantee Banner)
                      const PropertyRentGuaranteeBanner(),

                      const SizedBox(height: 100), // مساحة للزر السفلي
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 6. الزر السفلي الثابت (Sticky Bottom Bar)
          _buildStickyBottomBar(context),
        ],
      ),
    );
  }

  // --- بناء الأجزاء الفرعية ---

  Widget _buildImageHeader(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(top: 40, right: 20, child: _circleIcon(Icons.share)),
        Positioned(
          top: 40,
          left: 20,
          child: _circleIcon(Icons.arrow_back_ios_new),
        ),
      ],
    );
  }

  Widget _buildFeaturesSection() {
    return const PropertyFeaturesGrid();
  }

  Widget _buildStickyBottomBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomOnboardingButton(
                text: "أضف إلي العربة",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PropertyCartScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 15),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "AED 5,000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "الحد الأدنى",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // دوال مساعدة صغيرة
  Widget _circleIcon(IconData icon) => Container(
    padding: const EdgeInsets.all(8),
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Icon(icon, size: 20),
  );
}
