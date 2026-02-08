import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.image,
    this.height = 120,
    this.width = 120,
    this.color,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
    this.blendMode = BlendMode.srcIn, 
  });

  final String image;
  final double height;
  final double width;
  final Color? color;
  final BoxFit fit;
  final double borderRadius;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: fit,
            colorFilter: color != null
                ? ColorFilter.mode(color!, blendMode)
                : null,
          ),
        ),
      ),
    );
  }
}
