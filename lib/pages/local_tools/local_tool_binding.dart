import 'package:get/get.dart';

import 'local_tool_logic.dart';

class LocalToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
