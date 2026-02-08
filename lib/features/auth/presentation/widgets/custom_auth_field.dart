import 'package:flutter/material.dart';

class CustomAuthField extends StatelessWidget {
  final String hint;
  final IconData? prefixIcon; // الأيقونة اللي على اليمين (في التصميم العربي)
  final IconData? suffixIconData; // الأيقونة اللي على اليسار (مثل العين)
  final bool isPassword;

  const CustomAuthField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIconData,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        obscureText: isPassword,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          // تبديل أماكن الأيقونات ليتناسب مع التصميم العربي المعروض
          suffixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey.shade400) : null,
          prefixIcon: suffixIconData != null ? Icon(suffixIconData, color: Colors.grey.shade400) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        ),
      ),
    );
  }
}