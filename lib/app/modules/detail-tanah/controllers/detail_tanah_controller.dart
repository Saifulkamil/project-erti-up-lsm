import 'package:get/get.dart';

import '../../../models/asets.dart';

class DetailTanahController extends GetxController {
  AsetsModel? asetsModel;
  @override
  void onInit() {
    super.onInit();
    asetsModel = Get.arguments;
  }
}
