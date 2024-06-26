import 'package:aset_and_properti_up_lsm/app/models/orders.dart';
import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../models/asets.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/component/widget_loading.dart';

class FormBookingController extends GetxController {
  final loading = WidgetLoading();
  TextEditingController namaC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController instansiC = TextEditingController();
  TextEditingController jangkaWaktuSewaC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final selectedDate = DateTime.now().obs;
  final createdAt = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthController>();

  AsetsModel? asetsModel;
  OrdersModel? ordersModel;
  @override
  void onInit() {
    super.onInit();
    asetsModel = Get.arguments;
  }

  void selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1945),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: greenColor,
              onPrimary: Colors.white,
              surface: whiteMain,
              onSurface: blackColor,
            ),
            dialogBackgroundColor: Colors.blue[900],
          ),
          child: child!,
        );
      },
    ).then((picked) async {
      if (picked != null && picked != selectedDate.value) {
        selectedDate(picked);
        QuerySnapshot mulaiSewaQuery = await firestore
            .collection("orders")
            .where('mulai_sewa_tanggal',
                isLessThanOrEqualTo: selectedDate.value)
            .get();

        // Query kedua untuk akhir_sewa_tanggal
        QuerySnapshot akhirSewaQuery = await firestore
            .collection("orders")
            .where('akhir_sewa_tanggal',
                isGreaterThanOrEqualTo: selectedDate.value)
            .get();

        List<DocumentSnapshot> combinedResults = mulaiSewaQuery.docs
            .where((doc) =>
                akhirSewaQuery.docs.any((akhirDoc) => akhirDoc.id == doc.id))
            .toList();

        // Cetak hasil
        // print(Timestamp.fromDate(selectedDate.value));
        // print(combinedResults.length);
        if (combinedResults.isNotEmpty) {
          Get.defaultDialog(
              title: "MAAF",
              middleText: "maaf untuk tanggal ini sudah ada yang booking",
              backgroundColor: whiteMain);
        } else {
          selectTime(context);
        }
      }
    });
  }

  void selectTime(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: greenColor,
              onPrimary: Colors.white,
              surface: whiteMain,
              onSurface: blackColor,
            ),
            dialogBackgroundColor: Colors.blue[900],
          ),
          child: child!,
        );
      },
    ).then((picked) {
      if (picked != null && picked != selectedTime.value) {
        selectedTime(picked);
      }
    });
  }

  @override
  void dispose() {
    namaC.dispose();
    phoneC.dispose();
    instansiC.dispose();
    jangkaWaktuSewaC.dispose();
    hargaC.dispose();
    super.dispose();
  }

  Future<void> bookinAset(String name, String nohp, String? instansi,
      String? jangkaWaktuSewa) async {
    String createdate = createdAt.string;
    CollectionReference order = firestore.collection('orders');
    CollectionReference asets = firestore.collection('asets');
    CollectionReference users = firestore.collection('users');
    int? jangkasewa = int.tryParse(jangkaWaktuSewa!);
    DateTime? newDate;
    if (asetsModel!.data!.jangka_waktu == "SETENGAH HARI" ||
        asetsModel!.data!.jangka_waktu == "HARIAN") {
      newDate = selectedDate.value.add(Duration(days: jangkasewa ?? 0));
    } else if (asetsModel!.data!.jangka_waktu == "BULANAN") {
      newDate = selectedDate.value.add(Duration(days: jangkasewa! * 30));
    } else if (asetsModel!.data!.jangka_waktu == "TAHUNAN") {
      newDate = selectedDate.value.add(Duration(days: jangkasewa! * 360));
    }
    DateTime getDateWithZeroTime() {
      // Ensure a valid DateTime object
      final now = selectedDate.value ?? DateTime.now();

      // Set the time to 00:00:00
      return DateTime(now.year, now.month, now.day);
    }

    try {
      loading.loading(Get.overlayContext!);

      await order.add({
        "name": name,
        "phone": nohp,
        "jangka_waktu_sewa": jangkasewa,
        "orders_aset": asets.doc(asetsModel!.docId),
        "orders_user": users.doc(authC.email),
        "mulai_sewa_tanggal": Timestamp.fromDate(getDateWithZeroTime()),
        "akhir_sewa_tanggal": Timestamp.fromDate(newDate!),
        "created_at": createdate,
        "update_at": createdate,
        "instansi": instansiC.text,
        "total_pembayaran": asetsModel!.data!.harga! * jangkasewa!,
        "status_pembayaran": false,
      }).then(
        (value) {
          firestore
              .collection(value.parent.id)
              .doc(value.id)
              .get()
              .then((DocumentSnapshot documentSnapshot) async {
            if (documentSnapshot.exists) {
              Map<String, dynamic> dataBooking =
                  documentSnapshot.data() as Map<String, dynamic>;

              DocumentSnapshot aset =
                  await firestore.doc(dataBooking["orders_aset"].path).get();
              DocumentSnapshot user =
                  await firestore.doc(dataBooking["orders_user"].path).get();

              dataBooking["orders_aset"] = aset.data();
              dataBooking["orders_user"] = user.data();
              Map<String, dynamic> orderdata = {
                "docId": value.id,
                "data": dataBooking
              };
              OrdersModel ordersModel = OrdersModel.fromJson(orderdata);

              Get.toNamed(Routes.PANDUAN_PAY, arguments: ordersModel);
            }
          });
        },
      ).catchError((error) {
        if (kDebugMode) {
          print("Failed to add asets: $error");
        }
      });
    } on FirebaseException catch (e) {
      Get.back();
      if (kDebugMode) {
        print(e.code);
      }
    } catch (e) {
      Get.back();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
