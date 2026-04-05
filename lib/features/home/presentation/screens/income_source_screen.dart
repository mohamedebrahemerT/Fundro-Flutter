import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/option_selection_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/investment_plan_screen.dart';

class IncomeSourceScreen extends StatelessWidget {
  const IncomeSourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionSelectionScreen(
      heading: "ما هو مصدر دخلك الرئيسي؟",
      subtitle: "الرجاء تحديد الخيار الأنسب لك",
      options: const [
        "المرتب",
        "المدخرات الشخصية",
        "دخل تجاري",
        "دخل استثماري",
        "ميراث",
      ],
      currentStep: 1,
      onContinue: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InvestmentPlanScreen()),
        );
      },
    );
  }
}
