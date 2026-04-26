import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/auth/presentation/screens/login_screen.dart';
import 'package:fundro_app/features/on_boarding/presentation/widgets/custom_onboarding_button.dart';
import 'package:fundro_app/features/on_boarding/presentation/widgets/on_boarding_content.dart';
import 'package:get/get.dart';

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
            SizedBox(height: 30),
            _buildHeader(),
            SizedBox(height: 30),
            // محتوى الصفحات
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemCount: AppConstants.onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  model: AppConstants.onboardingData[index],
                ),
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
                    text:
                        _currentIndex == AppConstants.onboardingData.length - 1
                        ? "ابدأ الآن"
                        : "التالي",
                    onPressed: () {
                      if (_currentIndex <
                          AppConstants.onboardingData.length - 1) {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        Get.to(() => const LoginScreen());
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  if (_currentIndex == 0)
                    CustomOnboardingButton(
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      text: "سجل الأن",
                      onPressed: () {
                        if (_currentIndex <
                            AppConstants.onboardingData.length - 1) {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          Get.to(() => const LoginScreen());
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFCDFEE3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(Images.language, height: 16, width: 16),
                const SizedBox(width: 5),
                const Text(
                  "تغيير اللغة",
                  style: TextStyle(
                    color: Color(0xFF02C780),
                    fontSize: 15,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "تخطي",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Icon(Icons.arrow_forward, color: Color(0xFF1ED68D)),
            ],
          ),
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
          height: 12,
          width: _currentIndex == index ? 24 : 10,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: _currentIndex == index ? Color(0xFF1ED794) : Colors.black,
            ),
            shape: BoxShape.circle,
            color: _currentIndex == index ? Color(0xFF1ED794) : Colors.white,
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
        Text(
          "شركة فاندرو مرخصة من هيئة السوق المالية",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
