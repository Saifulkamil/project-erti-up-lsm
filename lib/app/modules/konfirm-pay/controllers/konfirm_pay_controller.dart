import 'dart:io';

import 'package:aset_and_properti_up_lsm/app/models/orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_loading.dart';

class KonfirmPayController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final storage = FirebaseStorage.instance;
  final loading = WidgetLoading();
  TextEditingController namaC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController pesanC = TextEditingController();
  TextEditingController namaRekeningPengirimC = TextEditingController();
  TextEditingController jumlahHargaC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? namaBank;
  OrdersModel? ordersModel;
  File? image;
  var isImagePayment = false.obs;
  var imagePathPayment = "".obs;
  @override
  void onInit() {
    super.onInit();
    ordersModel = Get.arguments;
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
    });
  }

  void setpicture(String path) {
    String fileName = path.split('/').last;
    imagePathPayment.value = fileName;
    isImagePayment.value = true;
  }

  Future<void> pilihfoto() async {
    var imagepick = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagepick != null) {
      File imageFile = File(imagepick.path);

      // ignore: unnecessary_null_comparison
      if (imageFile != null) {
        image = File(imageFile.path);
        setpicture(image!.path);
      }
    }
  }

  Future<void> payment(
    String name,
    int? nohp,
    String? namarek,
    int? jumlah,
  ) async {
    String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate.value);

    final storageRef = storage.ref();

    CollectionReference orders = firestore.collection('orders');
    final asetRef = storageRef.child("payment/");
    CollectionReference payments = firestore.collection('payments');
    try {
      loading.loading(Get.overlayContext!);
      await asetRef
          .child("${ordersModel!.data!.orderUser!.email}")
          .child(imagePathPayment.value)
          .putFile(image!);

      await payments.add({
        "tanggal_TF": formattedDate,
        "nama_TF": name,
        "nohp_TF": nohp,
        "name_rek": namaRekeningPengirimC.text,
        "name_bank": namaBank,
        "jumlah": jumlah,
        "foto_bukti": imagePathPayment.value,
        "pesan": pesanC.text == null ? "-" : pesanC.text,
        "payment_order": orders.doc(ordersModel!.docId),
      }).then(
        (value) {
          Get.toNamed(Routes.HOME);
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
        print("roor $e");
      }
    }
  }

  @override
  void dispose() {
    namaC.dispose();
    phoneC.dispose();
    pesanC.dispose();
    namaRekeningPengirimC.dispose();
    jumlahHargaC.dispose();
    super.dispose();
  }
}
