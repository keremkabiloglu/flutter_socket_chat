import 'dart:convert';

abstract class SocketDto {
  Map<String, dynamic> toJson();

  @override
  String toString() => jsonEncode(toJson());
}
