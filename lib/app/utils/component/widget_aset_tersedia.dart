import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:aset_and_properti_up_lsm/app/utils/text.dart';
import 'package:flutter/material.dart';

class AsetTersedia extends StatelessWidget {
  const AsetTersedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            Container(
              width: 335,
              height: 110,
              color: colorTransparan,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/image/img_vocaject.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: greenColor, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "sdfsdfsdfsd",
                    style: ColorApp.whiteTextStyly(context)
                        .copyWith(fontSize: 12, fontWeight: semiBold),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(aset_tersedia,
            style: ColorApp.blackTextStyle(context)
                .copyWith(fontSize: 16, fontWeight: semiBold)),
        Text(aset_tersedia,
            style: ColorApp.blackTextStyle(context)
                .copyWith(fontSize: 14, fontWeight: reguler)),
      ],
    );
  }
}
