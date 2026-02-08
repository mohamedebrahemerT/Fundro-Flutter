import 'package:flutter/material.dart';

class UIHelpers {
  // الهيدر الموحد لجميع شاشات الـ Auth
  static Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F9F3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.language, size: 16, color: Color(0xFF1ED794)),
                SizedBox(width: 5),
                Text("تغيير اللغة", style: TextStyle(color: Color(0xFF1ED794), fontSize: 13)),
              ],
            ),
          ),
          const Text("FuDro", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF006D44))),
        ],
      ),
    );
  }

  // مؤشر النقاط السفلي
  static Widget buildDotsIndicator(int activeIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: index == activeIndex ? const Color(0xFF1ED794) : Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
      )),
    );
  }
}