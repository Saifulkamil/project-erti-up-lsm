import 'package:aset_and_properti_up_lsm/app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../colors.dart';

class WidgetKategoriPoject extends StatelessWidget {
  const WidgetKategoriPoject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.KATEGORI);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 41.4,
                    child: Image.asset(
                      "assets/image/ic_mobile.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(tanah,
                      style: ColorApp.blackTextStyle(context)
                          .copyWith(fontSize: 12, fontWeight: light))
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40.11,
                    child: Image.asset(
                      "assets/image/ic_web.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(rumah_dinas1,
                      textAlign: TextAlign.center,
                      style: ColorApp.blackTextStyle(context)
                          .copyWith(fontSize: 12, fontWeight: light))
                ],
              ),
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 39,
                    width: 40.11,
                    child: Image.asset(
                      "assets/image/ic_desain.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(gedung_aula1,
                      textAlign: TextAlign.center,
                      style: ColorApp.blackTextStyle(context)
                          .copyWith(fontSize: 12, fontWeight: light))
                ],
              ),
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40.11,
                    child: Image.asset(
                      "assets/image/ic_editor.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(gedung_aula1,
                      textAlign: TextAlign.center,
                      style: ColorApp.blackTextStyle(context)
                          .copyWith(fontSize: 12, fontWeight: light)),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
