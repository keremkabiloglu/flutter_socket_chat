import 'topic.dart';

class SocketEventListener {
  final Topic topic;
  final void Function(Map<String, dynamic>) callback;

  SocketEventListener({
    required this.topic,
    required this.callback,
  });
}
