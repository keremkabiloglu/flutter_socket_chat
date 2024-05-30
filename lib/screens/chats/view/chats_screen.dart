import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/chats_screen_controller.dart';
import 'components/chat_list_item.dart';

class ChatsScreen extends GetView<ChatsScreenController> {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'CHATS'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 1,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.clients.value.length,
            itemBuilder: (context, index) => ChatListItem(
              client: controller.clients.value[index],
            ),
          ),
        ),
      ),
    );
  }
}
