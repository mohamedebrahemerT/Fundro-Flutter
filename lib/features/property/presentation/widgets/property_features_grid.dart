import 'package:flutter/material.dart';
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
        childAspectRatio: 2.3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        children: [
          PropertyFeatureItem(
            label: "الغرف",
            value: "4",
            icon: Icons.bed_outlined,
          ),
          PropertyFeatureItem(
            label: "المساحة",
            value: "280 متر مربع",
            icon: Icons.space_dashboard_outlined,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyDocumentsScreen(),
                ),
              );
            },
            child: const PropertyFeatureItem(
              label: "صك الملكية",
              value: "موجرة",
              icon: Icons.description_outlined,
            ),
          ),
          PropertyFeatureItem(
            label: "اسم الوحدة",
            value: "فيلا مارينا فيو 15",
            icon: Icons.home_outlined,
          ),
          PropertyFeatureItem(
            label: "المرحاض",
            value: "3",
            icon: Icons.bathtub_outlined,
          ),
          PropertyFeatureItem(
            label: "الحالة",
            value: "موقوفه جاهز للتأجير",
            icon: Icons.check_circle_outline,
          ),
          PropertyFeatureItem(
            label: "جول افتراضية",
            value: "3D",
            customIcon: Center(
              child: Text(
                "3D",
                style: TextStyle(
                  color: Color(0xFF1ED794),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          PropertyFeatureItem(
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
  final Widget? customIcon;

  const PropertyFeatureItem({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F9F3),
            borderRadius: BorderRadius.circular(12),
          ),
          child:
              customIcon ??
              Icon(icon, color: const Color(0xFF1ED794), size: 24),
        ),
      ],
    );
  }
}
