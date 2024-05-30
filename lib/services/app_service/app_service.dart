import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  void showSnackbar(String message, {bool isError = false}) => Get.snackbar(
        (isError ? 'ERROR' : 'SUCCESS').tr,
        message,
        snackPosition: SnackPosition.top,
        backgroundColor: isError ? Colors.red : Colors.green,
      );
}
