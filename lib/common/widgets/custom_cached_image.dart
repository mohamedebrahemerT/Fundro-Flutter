import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/images.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadiusDirection,
    this.fit = BoxFit.fill,
    this.borderRadius = 12,
    this.isCircular = false,
    this.circleDiameter,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double borderRadius;
  final BorderRadiusGeometry? borderRadiusDirection;
  final bool isCircular;
  final double? circleDiameter;

  @override
  Widget build(BuildContext context) {
    final double defaultWidth = Dimensions.width * 0.9;
    final double defaultHeight = Dimensions.height * 0.25;
    final double diameter = circleDiameter ?? (width ?? defaultWidth);

    Widget imageWidget;

    if (imageUrl.isEmpty) {
      imageWidget = Image.asset(
        Images.placeholder,
        width: width ?? defaultWidth,
        height: height ?? defaultHeight,
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        width: width ?? defaultWidth,
        height: height ?? defaultHeight,
        fit: fit,
        placeholder: (context, url) => Container(
          width: width ?? defaultWidth,
          height: height ?? defaultHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: borderRadiusDirection ?? BorderRadius.circular(borderRadius),
          ),
          child: Image.asset(
            Images.placeholder,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: width ?? defaultWidth,
          height: height ?? defaultHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: borderRadiusDirection ?? BorderRadius.circular(borderRadius),
          ),
          child: Image.asset(
            Images.placeholder,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      );
    }

    if (isCircular) {
      return ClipOval(
        child: SizedBox(
          width: diameter,
          height: diameter,
          child: imageWidget,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: borderRadiusDirection ?? BorderRadius.circular(borderRadius),
        child: imageWidget,
      );
    }
  }
}
