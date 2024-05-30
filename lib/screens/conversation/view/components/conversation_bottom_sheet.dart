import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/conversation_screen_controller.dart';

class ConversationBottomSheet extends GetView<ConversationScreenController> {
  const ConversationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: .5,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(8).add(
        EdgeInsets.only(
          bottom: Get.context!.mediaQueryViewInsets.bottom < 50
              ? Get.context!.mediaQueryViewPadding.bottom
              : 0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller.messageController,
              onChanged: controller.onMessageChanged,
              textInputAction: TextInputAction.newline,
              maxLength: 1000,
              maxLines: 10,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Obx(
              () => IconButton(
                icon: const Icon(CupertinoIcons.paperplane),
                onPressed: controller.sendMessageButtonEnabled.value
                    ? controller.sendMessage
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
