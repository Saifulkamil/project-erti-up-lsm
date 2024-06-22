import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import '../../../models/asest.dart';
import '../../../routes/app_pages.dart';

class FormBookingController extends GetxController {
  TextEditingController namaC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController instansiC = TextEditingController();
  TextEditingController jangkaWaktuC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AsestModel? asestdetail;
  @override
  void onInit() {
    super.onInit();
    asestdetail = Get.arguments;
    print(asestdetail);
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
            colorScheme: ColorScheme.light(
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
            colorScheme: ColorScheme.light(
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
    jangkaWaktuC.dispose();
    hargaC.dispose();
    super.dispose();
  }

  Future<void> bookinAset(String name, String nohp, String? instansi,
      String? jangkasewa) async {
    String formattedDate = DateFormat('dd-MM-yyyy')
        .format(selectedDate.value);
    String formattedTime =
        '${selectedTime.value.hour}:${selectedTime.value.minute}';

    CollectionReference order = firestore.collection('orders');
    int? JangkaWaktu = int.tryParse(jangkaWaktuC.text);

    print("$name $nohp $instansiC $jangkasewa");
    try {
      await order.add({
        "name": name,
        "phone": nohp,
        "properti": asestdetail!.kategori,
        "jangka_waktu": jangkaWaktuC.text,
        "jangka_waktu_sewa": JangkaWaktu,
        "mulai_sewa_tanggal": formattedDate,
        "mulai_sewa_waktu": formattedTime,
        "harga": asestdetail!.harga,
        "instansi": instansiC.text,
        "total_pembayaran": "${asestdetail!.harga! * JangkaWaktu! }",
      }).then(
        (value) {
          Get.toNamed(Routes.HOME);
          print("order added");
        },
      ).catchError((error) => print("Failed to add asets: $error"));
    } on FirebaseException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }
  }
}
