import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_primary_button.dart';
import 'package:fundro_app/features/auth/presentation/widgets/helper.dart';
import 'package:fundro_app/features/auth/presentation/widgets/password_field.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              UIHelpers.buildHeader(),
              const SizedBox(height: 40),
              const Text(
                "إنشاء كلمة مرور",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // حقل إدخال كلمة المرور (حالة النجاح/الخطأ)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF1ED794),
                  ), // أخضر للنجاح أو أحمر للخطأ
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Color(0xFF1ED794)),
                    const Expanded(
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "MOHAMED FARAG1988",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "كلمة المرور آمنة",
                style: TextStyle(color: Color(0xFF1ED794), fontSize: 12),
              ),

              const SizedBox(height: 20),

              // قائمة الشروط
              const PasswordRequirementItem(
                text: "لا تقل عن ثمانية أحرف",
                isMet: true,
              ),
              const PasswordRequirementItem(
                text: "تحتوي على الأقل على حرف كبير وحرف واحد صغير",
                isMet: true,
              ),
              const PasswordRequirementItem(
                text: "تحتوي على رقم واحد على الأقل",
                isMet: false,
              ),

              const SizedBox(height: 40),
              CustomPrimaryButton(
                text: "إنشاء حساب",
                backgroundColor: const Color(0xFF006D44), // الأخضر الداكن
                onPressed: () {},
              ),

              const Spacer(),
              UIHelpers.buildDotsIndicator(2),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
