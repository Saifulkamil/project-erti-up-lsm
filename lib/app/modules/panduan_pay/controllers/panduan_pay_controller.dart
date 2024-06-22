import 'package:aset_and_properti_up_lsm/app/models/orders.dart';
import 'package:get/get.dart';


class PanduanPayController extends GetxController {
  OrdersModel? ordersModel;
  @override
  void onInit() {
    super.onInit();
    ordersModel = Get.arguments;
  }
}
