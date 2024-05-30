import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class TranslationService extends GetxService {
  bool _initialized = false;
  late Rx<Locale> locale;
  final locales = const [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];

  /// Initializes the translation service
  /// Loads the default locale file
  /// If the device locale is not found, the first locale in the list is selected
  Future<void> init() async {
    if (_initialized) return;
    final languageCode = (Get.deviceLocale ?? locales.first).languageCode;
    final locale =
        locales.firstWhereOrNull((l) => l.languageCode == languageCode);
    if (locale != null) {
      this.locale = locale.obs;
      await changeLocale(this.locale.value.languageCode);
      _initialized = true;
    } else {
      throw Exception('LOCALE_NOT_FOUND');
    }
  }

  /// Changes the app's locale
  /// Example: changeLocale('tr'), changeLocale('en');
  /// Throws an exception if the locale file is not found
  Future<void> changeLocale(String languageCode) async {
    final locale =
        locales.firstWhereOrNull((l) => l.languageCode == languageCode);
    if (locale != null) {
      try {
        rootBundle
            .loadString('assets/lang/${locale.toString()}.json')
            .then((jsonStr) {
          final json = jsonDecode(jsonStr.replaceAll('\n', '')) as Map;
          Get.clearTranslations();
          final convertedJson = json.map((key, value) {
            return MapEntry<String, String>(key.toString(), value.toString());
          });
          Get.translations[locale.toString()] = convertedJson;
          this.locale.value = locale;
          Get.updateLocale(locale);
        });
      } catch (e) {
        throw Exception('LOCALE_FILE_NOT_FOUND');
      }
    } else {
      throw Exception('LOCALE_NOT_FOUND');
    }
  }
}
