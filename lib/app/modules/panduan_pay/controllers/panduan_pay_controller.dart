import 'package:aset_and_properti_up_lsm/app/models/orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PanduanPayController extends GetxController {
  FirebaseFirestore asetsFirestore = FirebaseFirestore.instance;
  OrdersModel? ordersModel;
  @override
  void onInit() {
    super.onInit();
    ordersModel = Get.arguments;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamImagepay() async* {
    yield* asetsFirestore.collection('ImageQris').snapshots();
  }
}
