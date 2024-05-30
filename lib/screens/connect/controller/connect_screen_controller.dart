import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/messaging_service/messaging_service.dart';
import '../../../services/socket_service/socket_service.dart';

class ConnectScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  void onPressedConnect() {
    if (formKey.currentState?.validate() ?? false) {
      Get.find<SocketService>().connect(nameController.text).then((connected) {
        if (connected) {
          Get.put(MessagingService(), permanent: true);
          Get.offAllNamed('/chats');
        }
      });
    }
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'NAME_CANNOT_BE_EMPTY'.tr;
    }
    return null;
  }
}
