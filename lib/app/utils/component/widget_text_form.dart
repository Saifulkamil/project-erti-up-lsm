import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:flutter/material.dart';

class WidgetTextForm extends StatelessWidget {
  bool? number;
   WidgetTextForm({
    this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return "* Password Harus Di Masukan";
      //   } else if (value.length < 8) {
      //     return "* Password harus 8 huruf";
      //   }
      //   return null;
      // },
      // controller: loginC.passC,
      
      keyboardType: number! ? TextInputType.text :TextInputType.phone,
      decoration: InputDecoration(
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
