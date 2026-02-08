import 'package:flutter/material.dart';

ThemeData light({Color color =  Colors.red}) => ThemeData(
  // fontFamily: AppConstants.fontFamily,
  primaryColor: color,
  secondaryHeaderColor: const Color(0xFF1ED7AA),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFFbebebe),
  // hintColor: const Color(0xFFf3f3f5),
  cardColor: Colors.white,
  shadowColor: Colors.black.withOpacity(0.03),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: color),
  ),
  colorScheme: ColorScheme.light(primary: color, secondary: color)
      .copyWith(surface: const Color(0xFFFCFCFC))
      .copyWith(error: const Color(0xFFE84D4F)),
  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  dialogTheme: const DialogThemeData(surfaceTintColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
  ),
  bottomAppBarTheme: const BottomAppBarThemeData(
    surfaceTintColor: Colors.white,
    height: 60,
    padding: EdgeInsets.symmetric(vertical: 5),
  ),
  dividerTheme: const DividerThemeData(
    thickness: 0.2,
    color: Color(0xFFA0A4A8),
  ),
  tabBarTheme: const TabBarThemeData(dividerColor: Colors.transparent),
);
/*
import 'package:flutter/material.dart';

ThemeData light() => ThemeData(
  brightness: Brightness.light,

  // 🎨 الألوان الأساسية
  primaryColor: const Color(0xFFFFB300), // ذهبي برتقالي
  secondaryHeaderColor: const Color(0xFF28B06E), // أخضر
  scaffoldBackgroundColor: const Color(0xFFFFF7EE), // بيج فاتح (خلفية)
  cardColor: const Color(0xFFFFFFFF), // أبيض نقي (البطاقات والعناصر البيضاء)

  // ⚙️ الألوان العامة
  hintColor: const Color(0xFF6B7280), // رمادي باهت للنصوص الثانوية
  shadowColor: Colors.black.withOpacity(0.05),
  disabledColor: const Color(0xFFBABFC4),

  colorScheme: const ColorScheme.light(
    primary: Color(0xFFFFB300),
    secondary: Color(0xFF28B06E),
    surface: Color(0xFFFFF7EE),
    error: Color(0xFFE84D4F),
  ),

  // 🧩 ألوان النصوص
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF213547)),   // رمادي غامق - النصوص الأساسية
    bodyMedium: TextStyle(color: Color(0xFF213547)),
    bodySmall: TextStyle(color: Color(0xFF6B7280)),   // رمادي باهت - النصوص الثانوية
    titleLarge: TextStyle(color: Color(0xFF213547)),
    titleMedium: TextStyle(color: Color(0xFF213547)),
    titleSmall: TextStyle(color: Color(0xFF6B7280)),
    labelLarge: TextStyle(color: Color(0xFF213547)),
  ),

  // 🧭 AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFF7EE),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Color(0xFF213547),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Color(0xFF213547)),
  ),

  // 📱 BottomAppBar
  // bottomAppBarTheme: const BottomAppBarTheme(
  //   color: Color(0xFFFFFFFF),
  //   surfaceTintColor: Color(0xFFFFFFFF),
  //   elevation: 8,
  // ),

  // ⚙️ أزرار
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFFFFB300),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFB300),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),

  // 📋 الفواصل
  dividerTheme: const DividerThemeData(
    thickness: 0.5,
    color: Color(0xFF6B7280),
  ),

  // 📄 النوافذ المنبثقة
  popupMenuTheme: const PopupMenuThemeData(
    color: Color(0xFFFFFFFF),
    surfaceTintColor: Color(0xFFFFFFFF),
  ),

  dialogTheme: const DialogThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    surfaceTintColor: Color(0xFFFFFFFF),
  ),
);


*/
