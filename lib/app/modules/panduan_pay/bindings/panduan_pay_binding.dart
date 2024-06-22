import 'package:get/get.dart';

import '../controllers/panduan_pay_controller.dart';

class PanduanPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanduanPayController>(
      () => PanduanPayController(),
    );
  }
}
