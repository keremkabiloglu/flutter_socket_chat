import 'package:get/route_manager.dart';

import '../screens/chats/controller/chats_screen_binding.dart';
import '../screens/chats/view/chats_screen.dart';
import '../screens/connect/controller/connect_screen_binding.dart';
import '../screens/connect/view/connect_screen.dart';
import '../screens/conversation/controller/conversation_screen_binding.dart';
import '../screens/conversation/view/conversation_screen.dart';

List<GetPage> pages = [
  GetPage(
    name: '/connect',
    page: () => const ConnectScreen(),
    binding: ConnectScreenBinding(),
  ),
  GetPage(
    name: '/chats',
    page: () => const ChatsScreen(),
    binding: ChatsScreenBinding(),
  ),
  GetPage(
    name: '/conversation/:clientName',
    page: () => const ConversationScreen(),
    binding: ConversationScreenBinding(),
  ),
];
