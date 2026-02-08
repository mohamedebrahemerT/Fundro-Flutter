import 'package:flutter/material.dart';

class SelectionOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String trailing;
  final bool isSelected;

  const SelectionOption({
    super.key,
    required this.title,
    this.subtitle,
    required this.trailing,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? Colors.black : Colors.grey.shade300, width: isSelected ? 2 : 1),
      ),
      child: Row(
        children: [
          Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                if (subtitle != null) Text(subtitle!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(trailing, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}