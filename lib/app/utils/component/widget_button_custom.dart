import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  final String text;
  IconData? icon;
  final VoidCallback onPressed;
   ButtonCustom({
    this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
            elevation: MaterialStateProperty.all(4),
            backgroundColor: MaterialStateProperty.all<Color>(greenColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: ColorApp.whiteTextStyly(context)
                    .copyWith(fontSize: 17, fontWeight: bold)),
                    const SizedBox(width: 10,),
                    icon == null ? const Center():
                    Icon(icon, color: whiteMain,size: 25)
          ],
        ),
      ),
    );
  }
}
