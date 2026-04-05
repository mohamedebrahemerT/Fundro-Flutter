import 'package:flutter/material.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_primary_button.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              _buildHeader(), // نستخدم الهيدر الموحد من الشاشات السابقة
              const SizedBox(height: 40),

              const Text(
                "مرحباً بك في فاندرو\nادخل رقم هاتفك",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1ED794),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 15),
              const Text(
                "سنرسل إليك رموزاً في رسالة نصية حتى نتمكن من تأكيد هويتك",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // حقل الهاتف المخصص
              const PhoneInputField(),

              const SizedBox(height: 40),

              // رابط إنشاء الحساب
              TextButton(
                onPressed: () {},
                child: const Text(
                  "قم بإنشاء حساب",
                  style: TextStyle(
                    color: Color(0xFF1ED794),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // زر إرسال الرمز (معطل افتراضياً كما في الصورة)
              const CustomPrimaryButton(
                text: "ارسال الرمز",
                onPressed: null, // تمرير null يجعله باللون الرمادي
              ),

              const Spacer(),

              // النقاط السفلية (Indicator)
              _buildDotsIndicator(0),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // فنكشن النقاط (يمكن نقلها لملف Utilities)
  Widget _buildDotsIndicator(int activeIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: index == activeIndex
                ? const Color(0xFF1ED794)
                : Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F9F3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.language, size: 16, color: Color(0xFF1ED794)),
                SizedBox(width: 5),
                Text(
                  "تغيير اللغة",
                  style: TextStyle(color: Color(0xFF1ED794), fontSize: 13),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            // width: Dimensions.width * 0.1,
          ),
        ],
      ),
    );
  }
}
