import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/features/on_boarding/presentation/widgets/custom_onboarding_button.dart';
import 'package:fundro_app/features/on_boarding/presentation/widgets/on_boarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // الهيدر (تخطي وتغيير اللغة)
            _buildHeader(),
            
            // محتوى الصفحات
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemCount: AppConstants.onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(model: AppConstants.onboardingData[index]),
              ),
            ),

            // النقاط (Dots Indicator)
            _buildDotsIndicator(),

            // الأزرار السفلية
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomOnboardingButton(
                    text: _currentIndex == AppConstants.onboardingData.length - 1 ? "ابدأ الآن" : "التالي",
                    onPressed: () {
                      if (_currentIndex < AppConstants.onboardingData.length - 1) {
                        _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                      }
                    },
                  ),
                  // جملة التراخيص أسفل الزر
                  SizedBox(height: 15),
                  _buildFooterLicense(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // فنكشن بناء الهيدر لمنع الزحمة في الـ Build
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: () {}, child: Text("تغيير اللغة", style: TextStyle(color: Color(0xFF1ED794)))),
          TextButton(onPressed: () {}, child: Text("تخطي", style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }

  // فنكشن النقاط
  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        AppConstants.onboardingData.length,
        (index) => Container(
          height: 8,
          width: _currentIndex == index ? 24 : 8,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _currentIndex == index ? Color(0xFF1ED794) : Colors.grey[300],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLicense() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.verified_user_outlined, size: 14, color: Colors.grey),
        SizedBox(width: 5),
        Text("شركة فاندرو مرخصة من هيئة السوق المالية", style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}