import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/translation_service/translation_service.dart';

class ChangeLangDropdown extends StatelessWidget {
  const ChangeLangDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: .5),
      ),
      child: Obx(
        () => DropdownButton<Locale>(
          padding: const EdgeInsets.all(4),
          isDense: true,
          underline: const SizedBox.shrink(),
          value: Get.find<TranslationService>().locale.value,
          onChanged: (locale) => locale != null
              ? Get.find<TranslationService>().changeLocale(locale.languageCode)
              : null,
          items: Get.find<TranslationService>()
              .locales
              .map(
                (locale) => DropdownMenuItem(
                  value: locale,
                  child: Text(locale.languageCode.toUpperCase()),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
