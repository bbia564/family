import 'package:get/get.dart';

import 'fa_set_logic.dart';

class FareBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
