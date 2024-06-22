import 'package:get/get.dart';

import '../../../models/asest.dart';

class DetailTanahController extends GetxController {
  AsestModel? asestdetail;
  @override
  void onInit() {
    super.onInit();
    asestdetail = Get.arguments;
    print(asestdetail);
  }
}
