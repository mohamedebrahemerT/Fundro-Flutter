import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:fundro_app/features/home/presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with light overlay
          Image.asset(
            Images.notificationBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(color: Colors.black.withOpacity(0.06)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const Spacer(flex: 3),

                Image.asset(Images.noti),
                const Spacer(flex: 2),

                const Text(
                  "احصل علي اشعارات بكل\n الامور المهمة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Cairo',
                    // fontWeight: FontWeight.bold,
                    color: Color(0xff1B1F22),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "يمكنك تغيير هذه الاعدادات اللاحقا",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16,
                    color: Color(0xff6E6E6E),
                  ),
                ),

                // const Spacer(flex: 2),
                SizedBox(height: 20),
                AuthButton(
                  text: "ليس الان",
                  gradient: const LinearGradient(
                    colors: [Color(0xFF02C780), Color(0xFF006746)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    Get.to(() => const HomeScreen());
                  },
                ),
                const SizedBox(height: 15),
                AuthButton(
                  text: "تفعيل الان",
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.to(() => const HomeScreen());
                  },
                ),

                const SizedBox(height: 40),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
