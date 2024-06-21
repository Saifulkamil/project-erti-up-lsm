import 'package:get/get.dart';

import '../controllers/detail_tanah_controller.dart';

class DetailTanahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTanahController>(
      () => DetailTanahController(),
    );
  }
}
