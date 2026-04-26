import 'package:flutter/material.dart';

/// زر الإجراء داخل كارد العقار
class ActionBtn extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;

  const ActionBtn({
    super.key,
    required this.text,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF00A269) : Colors.white,
          border: Border.all(color: const Color(0xFF00A269), width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? Colors.white : const Color(0xFF00A269),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ),
    );
  }
}
