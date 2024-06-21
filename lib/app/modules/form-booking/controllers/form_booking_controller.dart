import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormBookingController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
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
}
