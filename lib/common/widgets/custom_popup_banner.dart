import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';

class PopupBanner extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onClose;

  const PopupBanner({
    super.key,
    required this.imageUrl,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent, 
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                width: Dimensions.width * 0.9,
                height: Dimensions.height * 0.5,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: onClose,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
