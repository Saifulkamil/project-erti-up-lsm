import 'package:get/get.dart';

import '../controllers/form_booking_controller.dart';

class FormBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormBookingController>(
      () => FormBookingController(),
    );
  }
}
