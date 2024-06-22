import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class StatusBookingController extends GetxController {
  FirebaseFirestore asetsFirestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthController>();

  // String? kategori;
  // @override
  // void onInit() {
  //   super.onInit();
  //   kategori = Get.arguments;
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamAsets() async* {
    yield* asetsFirestore.collection('orders').snapshots();
  }
}
