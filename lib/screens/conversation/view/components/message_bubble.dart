import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../services/messaging_service/model/message.dart';
import '../../../../services/socket_service/socket_service.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final clientName = Get.find<SocketService>().client?.name;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Row(
        mainAxisAlignment: message.from == clientName
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: context.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: message.from == clientName
                  ? Colors.grey.shade300
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft:
                    Radius.circular(message.from == clientName ? 12 : 0),
                bottomRight:
                    Radius.circular(message.from == clientName ? 0 : 12),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.message,
                  style: TextStyle(
                    color: message.from == clientName
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat(
                    '${DateTime.now().subtract(24.hours).difference(message.date).inHours > 24 ? 'dd.MM.yyyy - ' : ''}hh:mm',
                  ).format(message.date),
                  style: TextStyle(
                    color: message.from == clientName
                        ? Colors.black.withOpacity(0.7)
                        : Colors.white.withOpacity(0.7),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
