import 'socket_message.dart';

class ErrorMessage extends SocketMessage {
  final String message;

  ErrorMessage({required super.date, required this.message});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      date: DateTime.parse(json['date'] ?? '19700101').toLocal(),
      message: json['message'] ?? '',
    );
  }
}
