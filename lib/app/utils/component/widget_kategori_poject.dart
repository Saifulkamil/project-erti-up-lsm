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
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Get.toNamed(Routes.KATEGORI, arguments: tanah),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 81.4,
                  child: Image.asset(
                    "assets/image/ic_tanah.png",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(tanah,
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: 12, fontWeight: light))
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.KATEGORI, arguments: rumah_dinas),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 81.4,
                  child: Image.asset(
                    "assets/image/ic_rumah_dinas.png",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(rumah_dinas1,
                    textAlign: TextAlign.center,
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: 12, fontWeight: light))
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.KATEGORI, arguments: gedung_aula),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 81.4,
                  child: Image.asset(
                    "assets/image/ic_gedung_aula.png",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(gedung_aula1,
                    textAlign: TextAlign.center,
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: 12, fontWeight: light))
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                Get.toNamed(Routes.KATEGORI, arguments: gedung_olahraga),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 71.4,
                  child: Image.asset(
                    "assets/image/ic_gedung_olahraga.png",
                  ),
                ),
                const SizedBox(
                  height: 10,
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
    ]);
  }
}
