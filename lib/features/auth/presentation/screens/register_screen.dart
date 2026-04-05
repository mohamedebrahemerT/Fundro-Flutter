import 'package:flutter/material.dart';
import 'package:fundro_app/features/auth/presentation/screens/phone_verfication_screen.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_field.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // نستخدم نفس الهيدر من الكود السابق
              _buildHeader(),

              const SizedBox(height: 30),
              const Text(
                "إنشاء حساب",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1ED794),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "انضم إلى آلاف الملاك الذين يديرون\nعقاراتهم بكفاءة",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.5),
              ),

              const SizedBox(height: 30),

              // قائمة الحقول
              const CustomAuthField(
                hint: "أدخل الاسم الكامل",
                prefixIcon: Icons.person_outline,
              ),
              const CustomAuthField(
                hint: "أدخل بريدك الإلكتروني أو رقم هاتفك",
                prefixIcon: Icons.email_outlined,
              ),
              const CustomAuthField(
                hint: "أدخل نوع الحساب",
                prefixIcon: Icons.person_search_outlined,
              ),
              const CustomAuthField(
                hint: "أدخل رقم الجوال",
                prefixIcon: Icons.phone_android_outlined,
                suffixIconData: Icons.visibility_off_outlined,
              ),
              const CustomAuthField(
                hint: "أدخل كلمة المرور",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                suffixIconData: Icons.visibility_off_outlined,
              ),

              // خيار الموافقة على الشروط
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "أوافق على شروط الخدمة وسياسة الخصوصية",
                    style: TextStyle(color: Color(0xFF1ED794), fontSize: 13),
                  ),
                  Checkbox(
                    value: _agreeToTerms,
                    activeColor: const Color(0xFF1ED794),
                    onChanged: (val) => setState(() => _agreeToTerms = val!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // زر تسجيل الحساب (لاحظ استخدام اللون الأخضر الداكن كما في الصورة)
              AuthButton(
                text: "تسجيل الحساب",
                color: const Color(0xFF006D44),
                textColor: Colors.white,
                onPressed: () {
                  Get.to(() => const PhoneVerificationScreen());
                },
              ),

              const SizedBox(height: 30),

              // نص التذييل (نفس الموجود في الـ Login)
              _buildFooterTerms(),
            ],
          ),
        ),
      ),
    );
  }

  // الهيدر الموحد
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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

  // نصوص الشروط بالأسفل
  Widget _buildFooterTerms() {
    return const Text.rich(
      TextSpan(
        text: "بالضغط على تسجيل الدخول فإنك توافق على ",
        style: TextStyle(color: Colors.grey, fontSize: 12),
        children: [
          TextSpan(
            text: "الشروط والأحكام\n",
            style: TextStyle(color: Colors.redAccent),
          ),
          TextSpan(text: "رأس المال معرض للخطر قبل الاستثمار يرجى قراءة "),
          TextSpan(
            text: "المخاطر الرئيسية",
            style: TextStyle(color: Colors.redAccent),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
