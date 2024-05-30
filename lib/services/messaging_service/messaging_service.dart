import 'package:get/get.dart';

import '../../screens/conversation/model/send_message_dto.dart';
import '../../util/model/socket_client.dart';
import '../socket_service/model/broadcast_message.dart';
import '../socket_service/model/broadcast_type.dart';
import '../socket_service/model/socket_event_listener.dart';
import '../socket_service/model/topic.dart';
import '../socket_service/socket_service.dart';
import 'model/message.dart';

class MessagingService extends GetxService {
  final _socketService = Get.find<SocketService>();
  final clients = Rx<List<SocketClient>>([]);
  final messages = Rx<List<Message>>([]);

  @override
  void onInit() {
    _addListeners();
    super.onInit();
  }

  void _addListeners() {
    _socketService.addListener(
      SocketEventListener(
        topic: Topic.broadcastMessage,
        callback: (body) {
          final broadcast = BroadcastMessage.fromJson(body);
          if (broadcast.type == BroadcastType.connected) {
            clients.value = [
              ...clients.value,
              SocketClient(
                name: broadcast.data['client'] ?? 'unknown',
              ),
            ];
          }
          if (broadcast.type == BroadcastType.disconnected) {
            clients.value = clients.value
                .where((client) =>
                    client.name != (broadcast.data['client'] ?? 'unknown'))
                .toList();
          }
        },
      ),
    );
    _socketService.addListener(
      SocketEventListener(
        topic: Topic.privateMessage,
        callback: (body) {
          final message = Message.fromJson(body);
          messages.value = [
            ...messages.value,
            message,
          ];
        },
      ),
    );
  }

  void sendMessage(SendMessageDto dto) {
    _socketService.emit(Topic.privateMessage, dto);
  }
}
