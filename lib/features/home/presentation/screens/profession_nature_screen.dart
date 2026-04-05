import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/custom_dropdown_selector.dart';
import 'package:fundro_app/features/home/presentation/screens/work_location_screen.dart';

class ProfessionNatureScreen extends StatefulWidget {
  const ProfessionNatureScreen({super.key});

  @override
  State<ProfessionNatureScreen> createState() => _ProfessionNatureScreenState();
}

class _ProfessionNatureScreenState extends State<ProfessionNatureScreen> {
  String? _selectedSector;
  String? _selectedProfession;

  final List<String> _sectors = [
    "الزراعة",
    "الأسلحة والذخيرة",
    "الفن والترفيه",
    "الطيران",
    "الخدمات المصرفية و المالية",
    "البناء",
  ];

  final List<String> _professions = [
    "ممثل",
    "مصمم",
    "مخرج",
    "منظم فعاليات",
    "موسيقي",
    "ساحر",
    "منتج",
  ];

  @override
  Widget build(BuildContext context) {
    // Check if the form is valid (i.e. both dropdowns are selected)
    final bool isFormValid =
        _selectedSector != null && _selectedProfession != null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                  ),
                  const Text(
                    "تفاصيل عملك",
                    style: TextStyle(
                      color: Color(0xFF1ED794),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    const Text(
                      "أخبرنا عن طبيعة عملك",
                      style: TextStyle(
                        color: Color(0xFF1ED794),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      "نحتاج معرفة النموذج الأكمل لعملك وهويتك لمساعدتنا في\nفهم طبيعة عملك",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        height: 1.5,
                      ),
                      textDirection: TextDirection.rtl,
                    ),

                    const SizedBox(height: 40),

                    CustomDropdownSelector(
                      label: "قطاع التوظيف",
                      hint: "اختر واحدة",
                      options: _sectors,
                      selectedValue: _selectedSector,
                      onChanged: (val) {
                        setState(() {
                          _selectedSector = val;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    CustomDropdownSelector(
                      label: "اختر مهنتك",
                      hint: "اختر واحدة",
                      options: _professions,
                      selectedValue: _selectedProfession,
                      onChanged: (val) {
                        setState(() {
                          _selectedProfession = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Page Indicators
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        final isActive = index == 3;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 8 : 6,
                          height: isActive ? 8 : 6,
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFF1ED794)
                                : Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isFormValid
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WorkLocationScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFormValid
                            ? const Color(0xFF006D44)
                            : const Color(0xFF9EA3A5),
                        disabledBackgroundColor: const Color(0xFF9EA3A5),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "متابعة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
