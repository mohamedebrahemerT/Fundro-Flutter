import 'package:flutter/material.dart';

class CustomAuthField extends StatelessWidget {
  final String hint;
  final dynamic prefixIcon; // Can be IconData, Widget, or String (asset path)
  final dynamic suffixIcon; // Can be IconData, Widget, or String (asset path)
  final bool isPassword;

  const CustomAuthField({
    super.key,
    required this.hint,
    this.prefixIcon,
    dynamic suffixIcon, 
    @Deprecated('Use suffixIcon instead') IconData? suffixIconData, 
    this.isPassword = false,
  }) : suffixIcon = suffixIcon ?? suffixIconData;

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
          // Prefix is normally left and Suffix is right.
          // In Arabic design, we put the primary icon (prefixIcon) on the right (suffixIcon in Flutter)
          // and the secondary icon (suffixIcon) on the left (prefixIcon in Flutter).
          suffixIcon: _buildIcon(prefixIcon),
          prefixIcon: _buildIcon(suffixIcon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        ),
      ),
    );
  }

  Widget? _buildIcon(dynamic iconData) {
    if (iconData == null) return null;
    if (iconData is IconData) {
      return Icon(iconData, color: Colors.grey.shade400);
    }
    if (iconData is Widget) {
      return iconData;
    }
    if (iconData is String) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(iconData, color: Colors.grey.shade400, width: 22, height: 22),
      );
    }
    return null;
  }
}