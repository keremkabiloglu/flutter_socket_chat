import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/conversation_screen_controller.dart';
import 'components/conversation_bottom_sheet.dart';
import 'components/message_bubble.dart';

class ConversationScreen extends GetView<ConversationScreenController> {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleSpacing: 0,
        title: Text(
          controller.remoteClient.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 1,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.messages.length,
            itemBuilder: (context, index) => MessageBubble(
              message: controller.messages[index],
            ),
          ),
        ),
      ),
      bottomSheet: const ConversationBottomSheet(),
    );
  }
}
