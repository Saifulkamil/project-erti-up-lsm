import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isHidden = true.obs;
  final formkey = GlobalKey<FormState>();

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }
}
