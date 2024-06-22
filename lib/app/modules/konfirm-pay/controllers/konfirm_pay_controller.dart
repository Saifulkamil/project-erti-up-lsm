import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';

class KonfirmPayController extends GetxController {
  final selectedDate = DateTime.now().obs;
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

  
}
