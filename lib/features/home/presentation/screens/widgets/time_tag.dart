import 'package:flutter/material.dart';

/// تاغ الوقت المتبقي
class TimeTag extends StatelessWidget {
  final String text;

  const TimeTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE4FFF1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00A269),
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.access_time, size: 16, color: Color(0xFF00A269)),
        ],
      ),
    );
  }
}
