import 'package:aset_and_properti_up_lsm/app/models/asets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore asetsFirestore = FirebaseFirestore.instance;
  List<dynamic> listAset = [].obs;
  List<dynamic> listodcId = [].obs;
  var isProjectLoaded = false.obs;

  DocumentSnapshot? aset;
  final selectedDate = DateTime.now().obs;
  DateTime getDateWithZeroTime() {
    // Ensure a valid DateTime object
    final now = selectedDate.value;

    // Set the time to 00:00:00
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void onInit() {
    getAset();
    super.onInit();
  }

 void getAset() {
  asetsFirestore
      .collection("orders")
      .where("mulai_sewa_tanggal", isEqualTo: Timestamp.fromDate(getDateWithZeroTime()))
      .get()
      .then((value) async {
    if (value.docs.isNotEmpty) {
      List<String> listodcId = [];
      for (var dataorders in value.docs) {
        DocumentSnapshot aset = await asetsFirestore.doc(dataorders["orders_aset"].path).get();
        listodcId.add(aset.id);
      }

      asetsFirestore.collection("asets").get().then((value) {
        for (var asetloop in value.docs) {
          if (!listodcId.contains(asetloop.id)) {
            Map<String, dynamic> dataAsetModel = {
              "docId": asetloop.id,
              "data": asetloop.data()
            };
            AsetsModel asetsModel = AsetsModel.fromJson(dataAsetModel);
            listAset.add(asetsModel);
          }
        }
        isProjectLoaded.value = true;
      });
    } else {
      asetsFirestore.collection("asets").get().then((value) {
        for (var asetOpen in value.docs) {
          Map<String, dynamic> dataAsetModel = {
            "docId": asetOpen.id,
            "data": asetOpen.data()
          };
          AsetsModel asetsModel = AsetsModel.fromJson(dataAsetModel);
          listAset.add(asetsModel);
        }
        isProjectLoaded.value = true;
      });
    }
  });
}

}
