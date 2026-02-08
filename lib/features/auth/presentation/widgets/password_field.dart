// ويدجت لعرض شروط كلمة المرور
import 'package:flutter/material.dart';

class PasswordRequirementItem extends StatelessWidget {
  final String text;
  final bool isMet;

  const PasswordRequirementItem({super.key, required this.text, required this.isMet});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // ليتناسب مع التصميم العربي
      children: [
        Text(
          text,
          style: TextStyle(color: isMet ? const Color(0xFF1ED794) : Colors.grey, fontSize: 12),
        ),
        const SizedBox(width: 8),
        Icon(
          isMet ? Icons.check_circle : Icons.check_circle_outline,
          color: isMet ? const Color(0xFF1ED794) : Colors.grey,
          size: 16,
        ),
      ],
    );
  }
}