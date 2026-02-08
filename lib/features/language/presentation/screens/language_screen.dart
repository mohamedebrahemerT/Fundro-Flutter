import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import '../widgets/language_switcher.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('account_info'.tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('delete_account'.tr),
            const SizedBox(height: 20),
            const LanguageSwitcher(),
          ],
        ),
      ),
    );
  }
}
