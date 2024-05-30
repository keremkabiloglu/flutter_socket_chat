import 'dart:convert';

abstract class SocketMessage {
  final DateTime date;

  SocketMessage({required this.date});

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
      };

  @override
  String toString() => jsonEncode(toJson());
}
