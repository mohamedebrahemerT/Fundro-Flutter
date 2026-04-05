import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/action_btn.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/info_row.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/status_tag.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/time_tag.dart';
import 'package:fundro_app/features/property/presentation/screens/property_details_screen.dart';
import 'package:fundro_app/theme/custom_decoration.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  final String status;
  final String timeLeft;
  final String imagePath;

  const PropertyCard({
    super.key,
    required this.title,
    required this.price,
    required this.location,
    required this.status,
    required this.timeLeft,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: CustomDecoration.getDecoration(
        context: context,
        hasShadow: false,
        borderColor: const Color(0xFF00A269),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // صورة العقار مع تاغ الوقت
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // تاغ الوقت المتبقي (أعلى يمين الصورة)
              Positioned(
                top: 10,
                right: 10,
                child: TimeTag(text: "متبقي $timeLeft"),
              ),
            ],
          ),
          // محتوى الكارد
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // العنوان
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // صف السعر
                InfoRow(
                  label: "السعر",
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // صف الموقع
                InfoRow(
                  label: "الموقع",
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(location, style: const TextStyle(fontSize: 13)),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Color(0xFF1ED794),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // صف التوافر
                InfoRow(
                  label: "التوافر",
                  child: StatusTag(status: status),
                ),
                const SizedBox(height: 18),
                // أزرار الإجراءات
                Row(
                  children: [
                    Expanded(
                      child: ActionBtn(
                        text: "استثمر الآن",
                        isPrimary: true,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ActionBtn(
                        text: "عرض التفاصيل",
                        isPrimary: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PropertyDetailsScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
