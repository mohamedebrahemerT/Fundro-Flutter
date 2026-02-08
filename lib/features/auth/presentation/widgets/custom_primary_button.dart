// زر مخصص يدعم الحالة المفعلة والمعطلة (مثل زر إرسال الرمز)
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // إذا كان null سيكون الزر معطلاً (رمادي)
  final Color? backgroundColor;

  const CustomPrimaryButton({
    super.key, 
    required this.text, 
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed == null 
              ? Colors.grey.shade400 // اللون الرمادي في الصورة الثالثة
              : (backgroundColor ?? const Color(0xFF1ED794)), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// حقل إدخال رقم الهاتف مع اختيار الدولة
class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // اختيار الدولة (يمين)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF1ED794)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.keyboard_arrow_down),
              const SizedBox(width: 5),
              Image.network('https://upload.wikimedia.org/wikipedia/commons/0/0d/Flag_of_Saudi_Arabia.svg', width: 25), // علم السعودية
            ],
          ),
        ),
        const SizedBox(width: 10),
        // حقل الرقم (يسار)
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF1ED794)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              textAlign: TextAlign.right,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "ادخل رقم الجوال",
                prefixText: "+966 ",
                prefixStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}