import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/option_selection_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/profession_nature_screen.dart';

class EmploymentStatusScreen extends StatelessWidget {
  const EmploymentStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionSelectionScreen(
      heading: "أخبرنا عن مجال عملك /وظيفتك",
      subtitle:
          "اختر وصف لك، نحن ملزمون بجمع هذه المعلومات للتعرف على طبيعة عملك",
      extraSubtitleWidget: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shield_outlined, color: Color(0xFF1ED794), size: 14),
            SizedBox(width: 4),
            Text(
              "لماذا نحتاج هذه المعلومات",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      options: const [
        "موظف",
        "عامل لحسابي الخاص",
        "طالب",
        "ربة منزل",
        "متقاعد",
      ],
      currentStep: 3,
      onContinue: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfessionNatureScreen(),
          ),
        );
      },
    );
  }
}
