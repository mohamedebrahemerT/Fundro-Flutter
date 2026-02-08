import 'package:flutter/material.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_primary_button.dart';
import 'package:fundro_app/features/auth/presentation/widgets/helper.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              UIHelpers.buildHeader(), // الهيدر الموحد
              const SizedBox(height: 30),
              const Text(
                "مرحباً . تحية خاصة لمسخد مينا من ب",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "السعودية ! 🇸🇦",
                style: TextStyle(
                  color: Color(0xFF1ED794),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "يرجى إدخال رمز التحقق المرسل إلى 551149549856\nستنتهي صلاحية رمز التحقق خلال 2m 59s",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),

              const SizedBox(height: 30),

              // حقل إدخال الرمز (يمكنك استخدام مكتبة pin_code_fields)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1ED794)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "• • • • • • • •",
                  style: TextStyle(letterSpacing: 10, fontSize: 20),
                ),
              ),

              const SizedBox(height: 15),
              const Text(
                "إعادة إرسال الرمز في 00:28s",
                style: TextStyle(color: Colors.red, fontSize: 13),
              ),

              const SizedBox(height: 40),
              const CustomPrimaryButton(
                text: "التحقق",
                onPressed: null,
              ), // زر معطل حتى يكتمل الرمز

              const Spacer(),
              UIHelpers.buildDotsIndicator(1), // النقطة الثانية نشطة
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
