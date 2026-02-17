import 'package:flutter/material.dart';
import 'package:fundro_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:fundro_app/features/auth/presentation/screens/register_screen.dart';
import 'package:fundro_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // الهيدر: زر تغيير اللغة واللوجو
              _buildHeader(),

              SizedBox(height: size.height * 0.05),

              const Text(
                "تسجيل الدخول",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1ED794),
                ),
              ),

              SizedBox(height: size.height * 0.04),

              // حقول الإدخال
              const CustomAuthField(
                hint: "أدخل بريدك الإلكتروني أو رقم هاتفك",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 15),
              const CustomAuthField(
                hint: "أدخل كلمة المرور",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey),
              ),

              // رابط نسيت كلمة المرور
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPasswordScreen());
                  },
                  child: const Text(
                    "نسيت كلمة المرور؟",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // أزرار تسجيل الدخول وإنشاء حساب
              AuthButton(
                text: "تسجيل الدخول",
                color: const Color(0xFF1ED794),
                textColor: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              AuthButton(
                text: "إنشاء الحساب",
                color: Colors.white,
                textColor: const Color(0xFF1ED794),
                borderColor: const Color(0xFF1ED794),
                onPressed: () {
                  print("object");
                  Get.to(() => const RegisterScreen());
                },
              ),

              // فاصل "أو"
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "أو",
                        style: TextStyle(color: Color(0xFF1ED794)),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
              ),

              // زر جوجل
              AuthButton(
                text: "تسجيل الدخول عبر جوجل",
                color: Colors.black,
                textColor: Colors.white,
                icon: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.png',
                  height: 20,
                ), // استخدم Asset في تطبيقك
                onPressed: () {},
              ),

              const SizedBox(height: 30),

              // نص الشروط والأحكام
              const Text.rich(
                TextSpan(
                  text: "بالضغط على تسجيل الدخول فإنك توافق على ",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  children: [
                    TextSpan(
                      text: "الشروط والأحكام\n",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    TextSpan(
                      text: "رأس المال معرض للخطر قبل الاستثمار يرجى قراءة ",
                    ),
                    TextSpan(
                      text: "المخاطر الرئيسية",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
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
                  style: TextStyle(color: Color(0xFF1ED794), fontSize: 14),
                ),
              ],
            ),
          ),
          // يمكنك وضع لوجو الشركة هنا
          const Text(
            "FuDro",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF006D44),
            ),
          ),
        ],
      ),
    );
  }
}
