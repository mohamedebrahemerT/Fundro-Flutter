import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/property/presentation/screens/property_documents_screen.dart';
import 'property_section_card.dart';

class PropertyFeaturesGrid extends StatelessWidget {
  const PropertyFeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return PropertySectionCard(
      title: "تفاصيل العقار",
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 2.2, // Adjusted for better fit
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        children: [
          // Row 1
          const PropertyFeatureItem(
            label: "الغرف",
            value: "4",
            imageIcon: Images.bedIcon,
          ),
          const PropertyFeatureItem(
            label: "المساحة",
            value: "280 متر مربع",
            icon: Icons.check_box_outline_blank, // Square-like icon
          ),
          // Row 2
          PropertyFeatureItem(
            label: "صك الملكية",
            value: "موجرة",
            imageIcon: Images.fileIcon,
            showArrow: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyDocumentsScreen(),
                ),
              );
            },
          ),
          const PropertyFeatureItem(
            label: "اسم الوحدة",
            value: "فيلا مارينا فيو 15",
            imageIcon: Images.villaIcon,
          ),
          // Row 3
          const PropertyFeatureItem(
            label: "المرحاض",
            value: "3",
            imageIcon: Images.wcIcon,
          ),
          const PropertyFeatureItem(
            label: "الحالة",
            value: "موقوفه جاهز للتأجير",
            icon: Icons.check_circle_outline,
          ),
          // Row 4
          const PropertyFeatureItem(
            label: "جول افتراضية",
            value: "3D",
            customIcon: Center(
              child: Text(
                "3D",
                style: TextStyle(
                  color: Color(0xFF00A269),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ),
          const PropertyFeatureItem(
            label: "الصور",
            value: "10 صور",
            icon: Icons.image_outlined,
          ),
        ],
      ),
    );
  }
}

class PropertyFeatureItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final String? imageIcon;
  final Widget? customIcon;
  final bool showArrow;
  final VoidCallback? onTap;

  const PropertyFeatureItem({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.imageIcon,
    this.customIcon,
    this.showArrow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (showArrow)
            const Padding(
              padding: EdgeInsets.only(right: 4),
              child: Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.black87),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFACAFB5),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF1D2126),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Cairo',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE4FFF1),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                customIcon ??
                (imageIcon != null 
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(imageIcon!, color: const Color(0xFF00A269)),
                      )
                    : Icon(icon, color: const Color(0xFF00A269), size: 22)),
          ),
        ],
      ),
    );
  }
}


