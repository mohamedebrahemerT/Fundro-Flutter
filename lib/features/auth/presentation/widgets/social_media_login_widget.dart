import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/theme/custom_decoration.dart';

class SocialMediaLoginWidget extends StatelessWidget {
  const SocialMediaLoginWidget({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });
  final String icon;
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimensions.height * 0.04,
        width: Dimensions.width * 0.75,
        decoration: CustomDecoration.getDecoration(
          context: context,
          hasShadow: false,
          borderColor: Theme.of(context).hintColor,
          borderRadius: Dimensions.radiusDefault,

          // color: Theme.of(context).primaryColor
        ),
        child: Row(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 20, height: 20),
            Text(label, style: cairoMedium),
          ],
        ),
      ),
    );
  }
}
