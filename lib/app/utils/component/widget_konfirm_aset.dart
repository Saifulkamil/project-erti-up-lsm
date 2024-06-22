
import 'package:aset_and_properti_up_lsm/app/models/orders.dart';
import 'package:aset_and_properti_up_lsm/app/utils/component/widget_button_custom.dart';
import 'package:aset_and_properti_up_lsm/app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../modules/form-booking/controllers/form_booking_controller.dart';
import '../../routes/app_pages.dart';
import '../colors.dart';

// ignore: must_be_immutable
class WidgetkonfirmAset extends StatelessWidget {
  FormBookingController? formBookingController;
  OrdersModel? ordersModel;
  WidgetkonfirmAset({
    this.formBookingController,
    this.ordersModel,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    if (formBookingController == null) {
      int? jangkawaktu = ordersModel!.jangkaWaktuSewa;
      final formatter = NumberFormat.currency(
          locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
      String? tanggalWaktusewa =
          "${ordersModel!.mulaiSewaTanggal} ${ordersModel!.mulaiSewaWaktu}";
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
                          "${ordersModel!.name}",
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
                          "${ordersModel!.phone}",
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
                            "${ordersModel!.ordersAset!.title}",
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
                          "${ordersModel!.jangkaWaktuSewa}",
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
                          "${ordersModel!.ordersAset!.jangka_waktu}",
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
                          tanggalWaktusewa,
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
                          formatter.format(ordersModel!.ordersAset!.harga),
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
                          "${ordersModel!.instansi}",
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
                          color: green10,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatter.format(
                                    ordersModel!.ordersAset!.harga! *
                                        jangkawaktu!),
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(fontSize: 16, fontWeight: bold),
                              ),
                              Text(
                                total_bayar,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ordersModel!.statusPembayaran == false
                        ? ButtonCustom(
                            text: bayar_sekarang,
                            onPressed: () {
                              Get.toNamed(Routes.PANDUAN_PAY,
                                  arguments: ordersModel);
                            },
                          )
                        : const Center(
                          child: Icon(
                              Icons.check_circle,
                              size: 70,
                              color: Colors.green,
                            ),
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
    } else {
      int? jangkawaktu =
          int.tryParse(formBookingController!.jangkaWaktuSewaC.text);
      final formatter = NumberFormat.currency(
          locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
      String formattedDate = DateFormat('dd-MM-yyyy')
          .format(formBookingController!.selectedDate.value);
      String formattedTime =
          '${formBookingController!.selectedTime.value.hour}:${formBookingController!.selectedTime.value.minute}';
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
                          formBookingController!.namaC.text,
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
                          formBookingController!.phoneC.text,
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
                            "${formBookingController!.asetdetail!.title}",
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
                          "${formBookingController!.asetdetail!.jangka_waktu}",
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
                          formBookingController!.jangkaWaktuSewaC.text,
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
                          "$formattedDate $formattedTime",
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
                          formatter
                              .format(formBookingController!.asetdetail!.harga),
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
                          formBookingController!.instansiC.text,
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
                          color: green10,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatter.format(
                                    formBookingController!.asetdetail!.harga! *
                                        jangkawaktu!),
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(fontSize: 16, fontWeight: bold),
                              ),
                              Text(
                                total_bayar,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(
                                        fontSize: 16, fontWeight: semiBold),
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
                        formBookingController!.bookinAset(
                          formBookingController!.namaC.text,
                          formBookingController!.phoneC.text,
                          formBookingController!.instansiC.text,
                          formBookingController!.jangkaWaktuSewaC.text,
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
}
