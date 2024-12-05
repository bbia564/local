import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_tool_logic.dart';

class LocalToolView extends GetView<PageLogic> {
  const LocalToolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.mante.value
              ? const CircularProgressIndicator(color: Colors.lightGreenAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.nouixl();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
