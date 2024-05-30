import 'package:get/get.dart';

import 'connect_screen_controller.dart';

class ConnectScreenBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut(() => ConnectScreenController()),
      ];
}
