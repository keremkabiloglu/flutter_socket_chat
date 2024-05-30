import 'package:get/get.dart';

import 'chats_screen_controller.dart';

class ChatsScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(() => ChatsScreenController()),
      ];
}
