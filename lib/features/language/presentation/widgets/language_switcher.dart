import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:fundro_app/core/utils/app_constants.dart';
import '../controllers/language_controller.dart';
import '../../domain/models/language_model.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LanguageController>();

    return Obx(() => DropdownButton<LanguageModel>(
          value: AppConstants.languages.firstWhere(
            (l) => l.code == controller.locale.languageCode,
          ),
          items: AppConstants.languages
              .map((lang) => DropdownMenuItem(
                    value: lang,
                    child: Text(lang.name),
                  ))
              .toList(),
          onChanged: (lang) {
            if (lang != null) {
              controller.setLanguage(Locale(
                          lang.code,
                          lang.countryCode,
                        ));
            }
          },
        ));
  }
}
