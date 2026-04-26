import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/auth/presentation/screens/finger_print_screen.dart';
import 'package:fundro_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:fundro_app/features/auth/presentation/screens/register_screen.dart';
import 'package:fundro_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:fundro_app/features/home/presentation/screens/home_screen.dart';
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

              Text(
                "تسجيل الدخول",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A269),
                ),
              ),

              SizedBox(height: size.height * 0.04),

              // حقول الإدخال
              const CustomAuthField(
                hint: "أدخل بريدك الإلكتروني أو رقم هاتفك",
                hintSize: 16,
                suffixIcon: Images.email,
              ),
              const SizedBox(height: 15),
              const CustomAuthField(
                hint: "أدخل كلمة المرور",
                hintSize: 16,
                suffixIcon: Images.lockIcon,
                isPassword: true,
                prefixIcon: Icon(Icons.visibility_outlined, color: Colors.grey),
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
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // أزرار تسجيل الدخول وإنشاء حساب
              AuthButton(
                text: "تسجيل الدخول",
                color: const Color(0xFF1ED68D),
                textColor: Colors.white,
                onPressed: () {
                  Get.to(() => const FingerPrintScreen());
                  // Get.to(() => const HomeScreen());
                },
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
                        style: TextStyle(
                          color: Color(0xFF1ED794),
                          fontSize: 15,
                        ),
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
                icon: Image.asset(
                  Images.googleIcon,
                  height: 20,
                ), // استخدم Asset في تطبيقك
                onPressed: () {},
              ),

              const SizedBox(height: 30),

              // نص الشروط والأحكام
              const Text.rich(
                TextSpan(
                  text: "بالضغط على تسجيل الدخول فإنك توافق على ",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
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
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
          // يمكنك وضع لوجو الشركة هنا
          Image.asset(
            'assets/images/logo.png',
            // width: Dimensions.width * 0.1,
          ),
          // const Text(
          //   "FuDro",
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.bold,
          //     color: Color(0xFF006D44),
          //   ),
          // ),
        ],
      ),
    );
  }


}
