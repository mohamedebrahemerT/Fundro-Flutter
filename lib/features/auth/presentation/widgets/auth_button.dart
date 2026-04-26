import 'package:flutter/material.dart';

// حقل الإدخال المخصص
class CustomAuthField extends StatelessWidget {
  final String hint;
  final dynamic prefixIcon;
  final bool isPassword;
  final dynamic suffixIcon;
  final double? hintSize;

  const CustomAuthField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.hintSize,
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
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: hintSize ?? 14),
          prefixIcon: _buildIcon(prefixIcon),
          suffixIcon: _buildIcon(suffixIcon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        ),
      ),
    );
  }

  Widget? _buildIcon(dynamic iconData) {
    if (iconData == null) return null;
    if (iconData is IconData) {
      return Icon(iconData, color: Colors.grey.shade500);
    }
    if (iconData is Widget) {
      return iconData;
    }
    if (iconData is String) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          iconData,
          color: Colors.grey.shade500,
          width: 22,
          height: 22,
        ),
      );
    }
    return null;
  }
}

// الزر المخصص (الأساسي والشفاف والمخصص لجوجل)
