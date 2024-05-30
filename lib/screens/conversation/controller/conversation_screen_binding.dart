import 'package:get/get.dart';

import 'conversation_screen_controller.dart';

class ConversationScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(() => ConversationScreenController()),
      ];
}
