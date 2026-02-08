import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fundro_app/core/utils/dimensions.dart';

class CustomSliderShimmer extends StatelessWidget {
  const CustomSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: Dimensions.height * 0.25, // نفس ارتفاع السلايدر الحقيقي
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
