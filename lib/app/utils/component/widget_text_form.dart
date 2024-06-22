import 'package:flutter/material.dart';

import '../colors.dart';

// ignore: must_be_immutable
class WidgetTextForm extends StatelessWidget {
  bool? number;
  IconData? icon;
  String? hintText;
  String? validasiText;
  TextEditingController? textControllet;

  WidgetTextForm({
    this.number,
    this.validasiText,
    this.textControllet,
    this.hintText,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validasiText;
        }
        // else if (value.length < 8) {
        //   return "* Password harus 8 huruf";
        // }
        return null;
      },
      controller: textControllet,
      keyboardType: number! ? TextInputType.text : TextInputType.phone,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: greyColor2,
          labelStyle: ColorApp.greyTextStyly(context).copyWith(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: colorTransparan),
              borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: blackColor, width: 2),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: blackColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
