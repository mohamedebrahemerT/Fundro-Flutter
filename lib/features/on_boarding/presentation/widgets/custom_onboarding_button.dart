import 'package:flutter/material.dart';

class CustomOnboardingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomOnboardingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF1ED794), // اللون الأخضر من الصورة
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55, // يمكنك جعلها ريسبونسف بضربها في MediaQuery
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}