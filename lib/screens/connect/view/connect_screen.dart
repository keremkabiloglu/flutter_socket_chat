import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/components/change_lang_dropdown.dart';
import '../controller/connect_screen_controller.dart';

class ConnectScreen extends GetView<ConnectScreenController> {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text('${'ENTER_YOUR_NAME'.tr}:'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: controller.nameController,
                    validator: controller.nameValidator,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.onPressedConnect,
                      child: Text('CONNECT'.tr),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('${'LANGUAGE'.tr}:'),
                    ),
                    const ChangeLangDropdown(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
