import 'package:flutter/material.dart';

class ExitWindowFeatureItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color titleColor;
  final Widget iconWidget;

  const ExitWindowFeatureItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.titleColor = Colors.black87,
    required this.iconWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: subtitle != null
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                  textAlign: TextAlign.right,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
          iconWidget,
        ],
      ),
    );
  }
}
