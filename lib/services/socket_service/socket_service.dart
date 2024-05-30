import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../util/model/socket_client.dart';
import '../app_service/app_service.dart';
import 'model/error_message.dart';
import 'model/socket_dto.dart';
import 'model/socket_event_listener.dart';
import 'model/topic.dart';

class SocketService extends GetxService {
  io.Socket? _socket;
  bool _connected = false;
  bool get connected => _connected;
  final List<SocketEventListener> _listeners = [];
  SocketClient? _client;
  SocketClient? get client => _client;

  /// Connects to the socket server with the given [name].
  Future<bool> connect(String name) {
    final completer = Completer<bool>();
    if (_socket == null || !_connected) {
      _socket = io.io('http://192.168.11.76:3000?name=$name', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      _socket!.connect();
      _socket!.onConnect((_) {
        _connected = true;
        _client = SocketClient(name: name);
        addListener(
          SocketEventListener(
            topic: Topic.errorMessage,
            callback: (body) {
              final errorMessage = ErrorMessage.fromJson(body);
              Get.find<AppService>().showSnackbar(
                errorMessage.message,
                isError: true,
              );
            },
          ),
        );
        completer.complete(true);
      });
      _socket!.onConnectError((_) {
        _connected = false;
        Get.log('SOCKET_CONNECTION_ERROR');
        completer.complete(false);
      });
      _socket!.onDisconnect((_) {
        _connected = false;
        Get.log('SOCKET_DISCONNECTED');
      });
      return completer.future;
    } else {
      Get.log('SOCKET_ALREADY_CONNECTED');
      return Future.value(false);
    }
  }

  /// Disconnects from the socket server.
  void disconnect() {
    _socket?.disconnect();
    _socket = null;
    Get.log('SOCKET_DISCONNECTED');
    Get.offAllNamed('/connect');
  }

  void addListener(SocketEventListener listener) {
    if (_socket != null && _connected) {
      final exist =
          _listeners.firstWhereOrNull((e) => e.topic == listener.topic);
      if (exist == null) {
        _listeners.add(listener);
        _socket!.on(listener.topic.name, (data) {
          final json = jsonDecode(data);
          listener.callback(json);
        });
      } else {
        throw Exception('LISTENER_ALREADY_EXISTS');
      }
    }
  }

  void removeListener(Topic topic) {
    final listener = _listeners.firstWhereOrNull((e) => e.topic == topic);
    if (listener != null) {
      _socket!.off(listener.topic.name);
      _listeners.remove(listener);
    } else {
      throw Exception('LISTENER_NOT_FOUND');
    }
  }

  void emit(Topic topic, SocketDto dto) {
    if (_socket != null && _connected) {
      _socket!.emit(topic.name, dto.toString());
    }
  }
}
