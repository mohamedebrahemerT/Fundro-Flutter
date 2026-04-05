import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/option_selection_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/employment_status_screen.dart';

class InvestmentPlanScreen extends StatelessWidget {
  const InvestmentPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionSelectionScreen(
      heading: "كم تخطط الاستثمار خلال ال 12 شهر القادمة؟",
      subtitle:
          "نحن مطالبون بجمع هذه المعلومات بموجب التعليمات التنظيمية وليس من المتوقع تجاوز أو أقل من هذا المبلغ",
      options: const [
        "أقل من 10,000 AED",
        "AED 10,000 - AED 30,000",
        "AED 30,000 - AED 100,000",
        "AED 100,000 - AED 300,000",
        "أكثر من 300,000 AED",
      ],
      currentStep: 2,
      onContinue: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EmploymentStatusScreen(),
          ),
        );
      },
    );
  }
}
