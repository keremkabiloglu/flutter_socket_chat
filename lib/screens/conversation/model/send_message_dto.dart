import '../../../services/socket_service/model/socket_dto.dart';

class SendMessageDto extends SocketDto {
  final String to;
  final String message;

  SendMessageDto({required this.to, required this.message});

  @override
  Map<String, dynamic> toJson() => {
        'to': to,
        'message': message,
      };
}
