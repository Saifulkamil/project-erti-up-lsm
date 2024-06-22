import 'package:flutter/material.dart';

import '../colors.dart';

class WidgetTextButton extends StatelessWidget {
  //untuk text pada button
  final String text;

  // untuk action pada button 
  final VoidCallback onPressed;
  
  const WidgetTextButton({ required this.onPressed,  required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: ColorApp.greenTextStyly(context).copyWith(
              fontSize: 14, fontWeight: semiBold)),
    );
  }
}