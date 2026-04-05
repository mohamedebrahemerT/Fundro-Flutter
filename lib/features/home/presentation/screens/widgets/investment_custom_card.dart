import 'package:flutter/material.dart';

class InvestmentCustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? leftText;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Widget? rightWidget;
  final Color backgroundColor;
  final Color textColor;
  final Color? subtitleColor;
  final Color? iconColor;
  final bool hasBorder;
  final VoidCallback? onTap;

  const InvestmentCustomCard({
    Key? key,
    required this.title,
    this.subtitle,
    this.leftText,
    this.leftIcon,
    this.rightIcon,
    this.rightWidget,
    required this.backgroundColor,
    required this.textColor,
    this.subtitleColor,
    this.iconColor,
    this.hasBorder = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: hasBorder
              ? Border.all(color: Colors.black87, width: 1)
              : null,
        ),
        child: Row(
          children: [
            // Left part
            if (leftIcon != null || leftText != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leftIcon != null)
                    Icon(leftIcon, color: textColor.withOpacity(0.8), size: 14),
                  if (leftIcon != null && leftText != null)
                    const SizedBox(width: 4),
                  if (leftText != null)
                    Text(
                      leftText!,
                      style: TextStyle(
                        color: textColor.withOpacity(0.9),
                        fontSize: 13,
                      ),
                    ),
                ],
              ),

            const Spacer(),

            // Right part (Text)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: subtitleColor ?? textColor.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),

            if (rightIcon != null || rightWidget != null)
              const SizedBox(width: 12),
            if (rightWidget != null)
              rightWidget!
            else if (rightIcon != null)
              Icon(rightIcon, color: iconColor ?? textColor, size: 30),
          ],
        ),
      ),
    );
  }
}
