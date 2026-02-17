import 'package:flutter/material.dart';
import 'package:fundro_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:get/get.dart';

import 'code_verfication_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
              "نسيت كلمة المرور",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "لإعادة تعيين كلمة المرور، الرجاء إدخال عنوان البريد الإلكتروني أو رقم هاتفك",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),
            // إعادة استخدام الحقل المخصص
            const CustomAuthField(
              hint: "أدخل بريدك الإلكتروني أو رقم هاتفك",
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: "ارسال الرمز",
              color: const Color(0xFF00A36C), // الأخضر المعتمد في الصور الأخيرة
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => const CodeVerificationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
