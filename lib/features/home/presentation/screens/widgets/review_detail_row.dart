import 'package:flutter/material.dart';

class ReviewDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onEdit;

  const ReviewDetailRow({
    Key? key,
    required this.label,
    required this.value,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onEdit,
            child: const Icon(
              Icons.edit_square,
              color: Color(0xFF1ED794),
              size: 18,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF003D2B),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.ltr, // For English text usually
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 120,
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Color(
                        0xFF003D2B,
                      ), // Dark green color matching image
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
