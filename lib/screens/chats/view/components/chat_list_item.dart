import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/model/socket_client.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key, required this.client});

  final SocketClient client;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: ListTile(
        onTap: () {
          Get.toNamed('/conversation/${client.name}');
        },
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(
          client.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
      ),
    );
  }
}
