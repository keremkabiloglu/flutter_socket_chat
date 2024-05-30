import 'broadcast_type.dart';
import 'socket_message.dart';

class BroadcastMessage extends SocketMessage {
  final BroadcastType type;
  final Map<String, dynamic> data;

  BroadcastMessage({
    required super.date,
    required this.type,
    required this.data,
  });

  factory BroadcastMessage.fromJson(Map<String, dynamic> json) =>
      BroadcastMessage(
        date: DateTime.parse(json['date'] ?? '19700101').toLocal(),
        type: BroadcastType.values.firstWhere(
          (e) => e.name == (json['type'] ?? ''),
          orElse: () => BroadcastType.unknown,
        ),
        data: json['data'] ?? {},
      );
}
