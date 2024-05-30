import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/messaging_service/messaging_service.dart';
import '../../../services/messaging_service/model/message.dart';
import '../../../util/model/socket_client.dart';
import '../model/send_message_dto.dart';

class ConversationScreenController extends GetxController {
  final _messagingService = Get.find<MessagingService>();
  late final SocketClient remoteClient;
  final messageController = TextEditingController();
  final sendMessageButtonEnabled = false.obs;
  List<Message> get messages => _messagingService.messages.value
      .where((m) => m.to == remoteClient.name || m.from == remoteClient.name)
      .toList();

  @override
  void onInit() {
    final remoteClient = Get.parameters['clientName'];
    if (remoteClient != null) {
      final orc = _messagingService.clients.value
          .firstWhereOrNull((c) => c.name == remoteClient);
      if (orc != null) {
        this.remoteClient = orc;
      } else {
        Get.back();
      }
    } else {
      Get.back();
    }
    super.onInit();
  }

  void onMessageChanged(String message) {
    if (message.isNotEmpty) {
      sendMessageButtonEnabled.value = true;
    } else {
      sendMessageButtonEnabled.value = false;
    }
  }

  void sendMessage() {
    _messagingService.sendMessage(
      SendMessageDto(
        to: remoteClient.name,
        message: messageController.text,
      ),
    );
    messageController.clear();
    sendMessageButtonEnabled.value = false;
  }
}
