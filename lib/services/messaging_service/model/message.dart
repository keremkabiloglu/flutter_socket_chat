import '../../socket_service/model/socket_message.dart';

class Message extends SocketMessage {
  final String id;
  final String from;
  final String to;
  final String message;

  Message({
    required super.date,
    required this.id,
    required this.from,
    required this.to,
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      date: DateTime.parse(json['date'] ?? '19700101').toLocal(),
      id: json['id'] ?? '',
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
