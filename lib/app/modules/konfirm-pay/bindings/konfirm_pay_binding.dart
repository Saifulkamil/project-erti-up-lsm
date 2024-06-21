import 'package:get/get.dart';

import '../controllers/konfirm_pay_controller.dart';

class KonfirmPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonfirmPayController>(
      () => KonfirmPayController(),
    );
  }
}
