import 'package:fundro_app/common/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String brand;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required double height, // لاستخدامه في تحديد أبعاد الصورة
    required this.image,
    required this.brand,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // جزء الصورة مع أيقونة السلة
        Stack(
          children: [
            CustomCachedImage(
              imageUrl: image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              borderRadius: 16,
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // نصوص المنتج
        Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text("\$$price", style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
