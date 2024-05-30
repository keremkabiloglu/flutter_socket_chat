import 'package:get/get.dart';

import '../../../services/messaging_service/messaging_service.dart';
import '../../../util/model/socket_client.dart';

class ChatsScreenController extends GetxController {
  Rx<List<SocketClient>> get clients => Get.find<MessagingService>().clients;

  @override
  void onInit() {
    super.onInit();
  }
}
