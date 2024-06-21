import 'package:get/get.dart';

import '../controllers/status_booking_controller.dart';

class StatusBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusBookingController>(
      () => StatusBookingController(),
    );
  }
}
