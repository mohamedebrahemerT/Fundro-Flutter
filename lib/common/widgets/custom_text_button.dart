import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: cairoMedium.copyWith(
          fontSize: Dimensions.fontSizeSmall,
          color: Colors.blue,
        ),
      ),
    );
  }
}
