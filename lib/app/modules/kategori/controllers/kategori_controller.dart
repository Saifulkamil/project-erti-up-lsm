import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class KategoriController extends GetxController {
  FirebaseFirestore asetsFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamAsets() async* {
  yield* asetsFirestore.collection('asets').snapshots();

  }
}
