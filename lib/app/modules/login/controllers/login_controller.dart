import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isHidden = true.obs;
  final formkey = GlobalKey<FormState>();

  TextEditingController emailC = TextEditingController(text: "saifulkamil18@gmail.com");
  TextEditingController passC = TextEditingController(text: "123");

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }
}
