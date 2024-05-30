import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/translation_service/translation_service.dart';
import 'util/pages.dart';
import 'util/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      initialRoute: '/connect',
      getPages: pages,
      locale: Get.find<TranslationService>().locale.value,
    );
  }
}
