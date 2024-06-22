import 'package:aset_and_properti_up_lsm/app/utils/component/widget_button_custom.dart';
import 'package:aset_and_properti_up_lsm/app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../modules/konfirm-pay/controllers/konfirm_pay_controller.dart';
import '../colors.dart';

// ignore: must_be_immutable
class WidgetkonfirmBayar extends StatelessWidget {
  KonfirmPayController? konfirmPayController;
  WidgetkonfirmBayar({
    this.konfirmPayController,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    String formattedDate = DateFormat('dd-MM-yyyy')
        .format(konfirmPayController!.selectedDate.value);
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
                        konfirmPayController!.namaC.text,
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
                        konfirmPayController!.phoneC.text,
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
                        nama_rekening_pengirim,
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
                          konfirmPayController!.namaRekeningPengirimC.text,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "JUMLAH TRANSFER",
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
                          formatter.format(int.tryParse(
                              konfirmPayController!.jumlahHargaC.text)),
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
                        "BANK",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        "${konfirmPayController!.namaBank}",
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
                        tanggal_transfer,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        formattedDate,
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
                        bukti_transfer,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        konfirmPayController!.imagePathPayment.value,
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
                        "PESAN",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 17, fontWeight: bold),
                      ),
                      Text(
                        
                        konfirmPayController!.pesanC.text,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  
                  
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonCustom(
                    text: bayar_sekarang,
                    onPressed: () {
                      konfirmPayController!.payment(
                        konfirmPayController!.namaC.text,
                        int.tryParse(konfirmPayController!.phoneC.text),
                        konfirmPayController!.namaRekeningPengirimC.text,
                        int.tryParse(konfirmPayController!.jumlahHargaC.text),
                      );
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
