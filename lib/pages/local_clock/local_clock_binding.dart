import 'package:get/get.dart';

import 'local_clock_logic.dart';

class LocalClockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalClockLogic());
  }
}
