import 'package:flutter/material.dart';

class CustomDecoration {
  static BoxDecoration getDecoration({
    required BuildContext context,
    bool isPressed = false,
    BorderRadiusGeometry? borderRadiusDirection,
    bool hasShadow = true,
    DecorationImage? image,
    double borderRadius = 12.0,
    Color? color,
    Color? borderColor, // 🔹 لون الحدود
    double borderWidth = 1.0, // 🔹 سمك الحدود
  }) {
    final Color baseColor = color ?? Theme.of(context).scaffoldBackgroundColor;

    return BoxDecoration(
      color: baseColor,
      borderRadius:
          borderRadiusDirection ?? BorderRadius.circular(borderRadius),
      image: image,
      border:borderColor != null ?Border.all(
        color: borderColor ,
        width: borderWidth,
      ):null,
      boxShadow: hasShadow
          ? (isPressed
                ? [
                    BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                      offset: const Offset(2, 2),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.7),
                      offset: const Offset(-2, -2),
                      blurRadius: 6,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.3),
                      offset: const Offset(3, 3),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                      offset: const Offset(-3, -3),
                      blurRadius: 6,
                    ),
                  ])
          : [],
    );
  }
}
