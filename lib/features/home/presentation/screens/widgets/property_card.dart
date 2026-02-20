import 'package:flutter/material.dart';
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
                child: _TimeTag(text: "متبقي $timeLeft"),
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
                _InfoRow(
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
                _InfoRow(
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
                _InfoRow(
                  label: "التوافر",
                  child: _StatusTag(status: status),
                ),
                const SizedBox(height: 18),
                // أزرار الإجراءات
                Row(
                  children: [
                    Expanded(
                      child: _ActionBtn(
                        text: "استثمر الآن",
                        isPrimary: true,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _ActionBtn(
                        text: "عرض التفاصيل",
                        isPrimary: false,
                        onTap: () {},
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

// صف معلومات مع عنوان (label) وقيمة (child)
class _InfoRow extends StatelessWidget {
  final String label;
  final Widget child;

  const _InfoRow({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        child,
      ],
    );
  }
}

// تاغ الوقت المتبقي
class _TimeTag extends StatelessWidget {
  final String text;
  const _TimeTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1ED794).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.access_time, size: 14, color: Color(0xFF1ED794)),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1ED794),
            ),
          ),
        ],
      ),
    );
  }
}

// تاغ الحالة (متاح/قريباً)
class _StatusTag extends StatelessWidget {
  final String status;
  const _StatusTag({required this.status});

  @override
  Widget build(BuildContext context) {
    bool isAvailable = status == "متاح";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: isAvailable ? const Color(0xFFE8F9F3) : const Color(0xFFFFF9E6),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          color: isAvailable
              ? const Color(0xFF1ED794)
              : const Color(0xFFFFC107),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ويدجت الأزرار داخل الكارد
class _ActionBtn extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ActionBtn({
    required this.text,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF1ED794) : Colors.white,
          border: Border.all(color: const Color(0xFF1ED794), width: 1.5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? Colors.white : const Color(0xFF1ED794),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
