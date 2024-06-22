import 'package:aset_and_properti_up_lsm/app/models/orders.dart';
import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  final selectedTime = TimeOfDay.now().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthController>();

  AsetsModel? asetdetail;
  OrdersModel? ordersModel;
  @override
  void onInit() {
    super.onInit();
    asetdetail = Get.arguments;

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
    ).then((picked) {
      if (picked != null && picked != selectedDate.value) {
        selectedDate(picked);
      }
      selectTime(context);
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
    String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate.value);
    String formattedTime =
        '${selectedTime.value.hour}:${selectedTime.value.minute}';

    CollectionReference order = firestore.collection('orders');
    int? jangkawaktusewa = int.tryParse(jangkaWaktuSewa!);

    try {
      loading.loading(Get.overlayContext!);

      await order.add({
        "name": name,
        "phone": nohp,
        "jangka_waktu_sewa": jangkawaktusewa,
        "orders_aset": {
          "title": asetdetail!.title,
          "lokasi": asetdetail!.lokasi,
          "alamat": asetdetail!.alamat,
          "kabupaten": asetdetail!.kabupaten,
          "harga": asetdetail!.harga,
          "picture": asetdetail!.picture,
          "kategori": asetdetail!.kategori,
          "jangka_waktu": asetdetail!.jangka_waktu,
        },
        "orders_users": {"email": authC.email},
        "mulai_sewa_tanggal": formattedDate,
        "mulai_sewa_waktu": formattedTime,
        "instansi": instansiC.text,
        "total_pembayaran": asetdetail!.harga! * jangkawaktusewa!,
        "status_pembayaran": false,
      }).then(
        (value) {
          firestore
              .collection(value.parent.id)
              .doc(value.id)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              Map<String, dynamic> data =
                  documentSnapshot.data() as Map<String, dynamic>;
              ordersModel = OrdersModel.fromJson(data);
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
