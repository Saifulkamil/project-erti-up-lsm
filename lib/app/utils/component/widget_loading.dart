import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetLoading extends GetxController {
  void loading(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: greenColor,
          ),
        );
      },
    );
  }
}
