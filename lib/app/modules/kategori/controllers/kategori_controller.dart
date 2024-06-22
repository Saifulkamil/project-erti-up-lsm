import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class KategoriController extends GetxController {
  FirebaseFirestore asetsFirestore = FirebaseFirestore.instance;

  String? kategori;
  @override
  void onInit() {
    super.onInit();
    kategori = Get.arguments;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamAsets() async* {
    yield* asetsFirestore.collection('asets').snapshots();
  }
}
