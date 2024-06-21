// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

const whiteMain = Color(0xFFFFFFFF);
const colorTransparan = Colors.transparent;
const greenColor = Color(0xFF166369);
const greyColor = Color(0xFF949494);    
const greyColor2 = Color(0xFFE4E4E4);    
const blackColor = Color(0xFF4D4D4D);
const green10 = Color(0xFFE7EFF1);
const greyColorOri = Colors.grey;
const redcolor = Color(0xFFD11818);

TextStyle redTextStyle = const TextStyle(color: redcolor);

TextStyle blackTextStyle = const TextStyle(color: blackColor);

TextStyle whiteTextStyle = const TextStyle(color: whiteMain);

TextStyle greyTextStyle = const TextStyle(color: greyColor);

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight blackBlod = FontWeight.w900;

class ColorApp {
  static TextStyle blackTextStyle(BuildContext context) {
    return const TextStyle(
      color: blackColor,
    );
  }

  static TextStyle greyTextStyly(BuildContext context) {
    return const TextStyle(
      color: greyColor,
    );
  }
  
  static TextStyle whiteTextStyly(BuildContext context) {
    return const TextStyle(
      color: whiteMain,
    );
  }
  static TextStyle greenTextStyly(BuildContext context) {
    return const TextStyle(
      color: greenColor,
    );
  }
}
