import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../models/asets.dart';

class KategoriController extends GetxController {
  FirebaseFirestore asetsFirestore = FirebaseFirestore.instance;
  List<dynamic> listAset = [].obs;
  List<dynamic> listodcId = [].obs;
  var isProjectLoaded = false.obs;
  String? kategori;
  @override
  void onInit() {
    getAset();
    super.onInit();
    kategori = Get.arguments;
  }

  DocumentSnapshot? aset;
  final selectedDate = DateTime.now().obs;
  DateTime getDateWithZeroTime() {
    // Ensure a valid DateTime object
    final now = selectedDate.value;

    // Set the time to 00:00:00
    return DateTime(now.year, now.month, now.day);
  }

void getAset() {
  asetsFirestore
      .collection("orders")
      .where("mulai_sewa_tanggal",
          isEqualTo: Timestamp.fromDate(getDateWithZeroTime()))
      .get()
      .then((value) async {
    List<String> listodcId = [];
    if (value.docs.isNotEmpty) {
      for (var dataorders in value.docs) {
        DocumentSnapshot aset =
            await asetsFirestore.doc(dataorders["orders_aset"].path).get();
        listodcId.add(aset.id);
      }
    }

    asetsFirestore.collection("asets").get().then((value) {
      for (var asetloop in value.docs) {
        bool isBooked = listodcId.contains(asetloop.id);
        Map<String, dynamic> dataAsetModel = {
          "docId": asetloop.id,
          "booking": isBooked,
          "data": asetloop.data()
        };
        AsetsModel asetsModel = AsetsModel.fromJson(dataAsetModel);
        if (asetsModel.data != null && asetsModel.data!.kategori == kategori) {
          listAset.add(asetsModel);
        }
      }
      isProjectLoaded.value = true;
    });
  });
}

}

              //