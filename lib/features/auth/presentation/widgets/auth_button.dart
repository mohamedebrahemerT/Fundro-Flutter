import 'package:flutter/material.dart';

// حقل الإدخال المخصص
class CustomAuthField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final Widget? suffixIcon;

  const CustomAuthField({
    super.key,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        obscureText: isPassword,
        textAlign: TextAlign.right, // يدعم العربية
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Icon(prefixIcon, color: Colors.grey.shade500),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}

// الزر المخصص (الأساسي والشفاف والمخصص لجوجل)
