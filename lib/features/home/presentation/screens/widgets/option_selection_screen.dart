import 'package:flutter/material.dart';

class OptionSelectionScreen extends StatefulWidget {
  final String heading;
  final String subtitle;
  final Widget? extraSubtitleWidget;
  final List<String> options;
  final int currentStep;
  final VoidCallback onContinue;

  const OptionSelectionScreen({
    Key? key,
    required this.heading,
    required this.subtitle,
    this.extraSubtitleWidget,
    required this.options,
    required this.currentStep,
    required this.onContinue,
  }) : super(key: key);

  @override
  State<OptionSelectionScreen> createState() => _OptionSelectionScreenState();
}

class _OptionSelectionScreenState extends State<OptionSelectionScreen> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
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

                    Text(
                      widget.heading,
                      style: const TextStyle(
                        color: Color(0xFF1ED794),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 12),

                    Text(
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                        height: 1.5,
                      ),
                      textDirection: TextDirection.rtl,
                    ),

                    if (widget.extraSubtitleWidget != null) ...[
                      const SizedBox(height: 8),
                      widget.extraSubtitleWidget!,
                    ],

                    const SizedBox(height: 40),

                    // Options List
                    ...widget.options.map((option) {
                      final isSelected = _selectedOption == option;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOption = option;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFE4F9F2)
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF1ED794)
                                  : const Color(0xFFFFD54F),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            option,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF006D44)
                                  : Colors.grey[600],
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
                        final isActive = index == (widget.currentStep - 1);
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
                      onPressed: _selectedOption != null
                          ? widget.onContinue
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedOption != null
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
