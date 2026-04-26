import 'package:flutter/material.dart';

/// تاغ الحالة (متاح / ممولة / مباع)
class StatusTag extends StatelessWidget {
  final String status;

  const StatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case 'متاح':
        bgColor = const Color(0xFFE8F9F3);
        textColor = const Color(0xFF1ED794);
        break;
      case 'ممولة':
        bgColor = const Color(0xFFE8F0FF);
        textColor = const Color(0xFF3B6FE8);
        break;
      case 'مباع':
        bgColor = const Color(0xFFFFF0F0);
        textColor = const Color(0xFFE84343);
        break;
      default:
        bgColor = const Color(0xFFFFF9E6);
        textColor = const Color(0xFFFFC107);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          color: textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),

      ),
    );
  }
}
