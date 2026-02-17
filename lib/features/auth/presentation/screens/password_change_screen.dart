import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/auth/presentation/screens/login_screen.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PasswordChangedSuccessScreen extends StatelessWidget {
  const PasswordChangedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة الهاتف مع علامة الصح (يمكن استبدالها بـ Stack من الأيقونات)
            Image.asset(Images.passwordChanged, height: 200),
            const SizedBox(height: 30),
            const Text(
              "لقد قمت بتغيير كلمة المرور الخاصة بك بنجاح!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A36C),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AuthButton(
                text: "العودة لتسجيل الدخول",
                color: const Color(0xFF00A36C),
                textColor: Colors.white,
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
