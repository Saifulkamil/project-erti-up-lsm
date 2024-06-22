import 'package:get/get.dart';

import '../../../models/asets.dart';

class DetailTanahController extends GetxController {
  AsetsModel? asestdetail;
  @override
  void onInit() {
    super.onInit();
    asestdetail = Get.arguments;
    (asestdetail);
  }
}
