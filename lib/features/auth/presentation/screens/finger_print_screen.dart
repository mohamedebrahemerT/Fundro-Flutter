import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/auth/presentation/screens/notification_permission_screen.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:get/get.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.fingerPrintBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.75)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.fingerPrint),
                    const SizedBox(width: 10),
                    Image.asset(Images.swap),
                    const SizedBox(width: 10),
                    Image.asset(Images.faceDetection),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  "تفعيل الهوية البيومترية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Cairo',
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "تسجل دخولك بسرعه وامان مع وجهك وابصمتك بدون الحاجة لكلمة مرور",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const Spacer(flex: 1),
                AuthButton(
                  text: "ليس الان",
                  // fontSize: 20,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF02C780), Color(0xFF006746)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    Get.to(() => NotificationPermissionScreen());
                  },
                ),
                const SizedBox(height: 15),
                AuthButton(
                  text: "تفعيل الان",
                  color: Colors.white,
                  // fontSize: 20,
                  textColor: Colors.black,
                  onPressed: () {
                    Get.to(() => NotificationPermissionScreen());
                  },
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
