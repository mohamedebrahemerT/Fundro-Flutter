import 'package:flutter/material.dart';

/// صف معلومات مع عنوان (label) وقيمة (child)
class InfoRow extends StatelessWidget {
  final String label;
  final Widget child;

  const InfoRow({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        child,
      ],
    );
  }
}
