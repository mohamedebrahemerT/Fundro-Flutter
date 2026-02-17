import 'package:flutter/material.dart';
import 'package:fundro_app/features/auth/presentation/screens/password_change_screen.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_otp_field.dart';
import 'package:get/get.dart';

class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.grey),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Text(
              "تحقق من الكود",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "يرجى التحقق من بريدك الإلكتروني أو رسائل الهاتف المحمول التي أرسلناها لك رمز التحقق",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 40),
            const Text(
              "أدخل التحقق الخاص بك",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // صف مربعات الـ OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => const CustomOtpField()),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                "لم تتلق الكود، اعادة ارسال؟",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Spacer(),
            AuthButton(
              text: "تأكيد",
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => const PasswordChangedSuccessScreen());
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
