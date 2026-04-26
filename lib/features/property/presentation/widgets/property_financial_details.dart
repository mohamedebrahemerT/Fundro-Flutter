import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'property_financial_row.dart';
import '../screens/property_sample_documents_screen.dart';

class PropertyFinancialDetails extends StatelessWidget {
  const PropertyFinancialDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        PropertyFinancialRow(
          label: "العائد السنوي",
          value: "9.67%",
          imageIcon: Images.fileIcon,
        ),
        const SizedBox(height: 18),
        PropertyFinancialRow(
          label: "سعر الشراء",
          value: "AED 2. 187.0000",
          imageIcon: Images.fileIcon,
        ),
        const SizedBox(height: 18),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PropertySampleDocumentsScreen(),
              ),
            );
          },
          child: const PropertyFinancialRow(
            label: "التقييم الحالي",
            value: "AED 2. 187.0000",
            imageIcon: Images.fileIcon,
          ),
        ),
        const SizedBox(height: 25),
        Divider(color: Colors.grey.shade200),
      ],
    );
  }
}
