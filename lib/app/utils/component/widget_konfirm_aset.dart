import 'dart:async';

import 'package:aset_and_properti_up_lsm/app/modules/form-booking/views/details_pay_view.dart';
import 'package:aset_and_properti_up_lsm/app/utils/component/widget_button_custom.dart';
import 'package:aset_and_properti_up_lsm/app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../routes/app_pages.dart';
import '../colors.dart';

class WidgetkonfirmAset extends StatelessWidget {
  const WidgetkonfirmAset({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // final formatter =
    //     NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    // int anggaran = int.parse(projectDetailsController.anggranC.text);
    // int jumlah = (anggaran + (anggaran * 0.05)).toInt();
    return Container(
      height: 740,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Container(
                    height: 5,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyColor),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: greenColor,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    order,
                    style: ColorApp.greenTextStyly(context)
                        .copyWith(fontSize: 20, fontWeight: bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nama,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        "polan polen",
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nohp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        "080234234",
                        style: ColorApp.greenTextStyly(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        properti,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          "Rp. {projectDetailsController.anggranC.text}",
                          textAlign: TextAlign.start,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jangka_waktu,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        tahunan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jangka_waktu_sewa,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        "1",
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mulai_sewa,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        "12-4-2002",
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        harga_sewa,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        "RP7.500.000",
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        instansi,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        "pnl",
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: green10, borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rp7.500.000",
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 16, fontWeight: bold),
                            ),
                            Text(
                              total_bayar,
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 16, fontWeight: semiBold),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonCustom(
                    text: bayar_sekarang,
                    onPressed: () {
                      Get.to(() => const DetailPayView());
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
