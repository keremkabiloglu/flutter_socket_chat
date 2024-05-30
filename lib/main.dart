import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'services/app_service/app_service.dart';
import 'services/socket_service/socket_service.dart';
import 'services/translation_service/translation_service.dart';

Future<void> initservices() async {
  Get.put(AppService(), permanent: true);
  await Get.put(TranslationService(), permanent: true).init();
  Get.put(SocketService(), permanent: true);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initservices().then(
    (_) => runApp(
      const App(),
    ),
  );
}
