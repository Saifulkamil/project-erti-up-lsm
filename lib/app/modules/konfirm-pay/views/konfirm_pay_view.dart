import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/konfirm_pay_controller.dart';

class KonfirmPayView extends GetView<KonfirmPayController> {
  const KonfirmPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KonfirmPayView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KonfirmPayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
