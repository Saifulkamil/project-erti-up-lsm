import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_text_form.dart';
import '../../../utils/text.dart';
import '../controllers/konfirm_pay_controller.dart';

class KonfirmPayView extends GetView<KonfirmPayController> {
  const KonfirmPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              konfirmasi_bayar,
              style: ColorApp.greenTextStyly(context)
                  .copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            pinned: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.DASHBORD);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: greenColor,
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tanggal_transfer,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        diperlukan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectDate(context);
                    },
                    child: Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: greyColor2,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range_sharp,
                              color: blackColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nama,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        diperlukan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  WidgetTextForm(number: true),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nohp,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        diperlukan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  WidgetTextForm(number: false),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nama_rekening_pengirim,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        diperlukan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  WidgetTextForm(number: true),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bank_pengirim,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        diperlukan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: greyColor2,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: DropdownSearch(
                            popupProps: const PopupProps.dialog(
                              showSearchBox: true,
                              searchFieldProps: TextFieldProps(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: greyColor2, width: 2),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: blackColor, width: 2),
                                      ),
                                      suffixIcon: Icon(Icons.search),
                                      hintText: cari_nama_bank,
                                      hoverColor: greenColor,
                                      focusColor: greenColor,
                                      fillColor: greenColor,
                                      contentPadding: EdgeInsets.all(15))),
                              searchDelay: Duration(milliseconds: 10),
                            ),
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colorTransparan),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: blackColor, width: 2),
                                ),
                              ),
                            ),
                            // itemAsString: (MahasiswaDetails user) =>
                            //     user.name ?? '',
                            // onChanged: (List<MahasiswaDetails?> selectedItems) {
                            //   projectDetailsController.selectedMahasiswa
                            //       .clear(); // Bersihkan list ID sebelum menambahkan yang baru
                            //   projectDetailsController.selectedMahasiswa.addAll(
                            //       selectedItems.map((item) => item!
                            //           .id!)); // Ambil ID dari item yang dipilih dan tambahkan ke list
                            // },
                            // asyncItems: (String filter) async {
                            // try {
                            //   final dataResponse =
                            //       await projectDetailsController
                            //           .getUserMhsAccepted();
                            //   if (dataResponse != null) {
                            //     return dataResponse.data
                            //         .where((user) => user.name!
                            //             .contains(filter.toUpperCase()))
                            //         .toList();
                            //   } else {
                            //     return []; // Mengembalikan list kosong jika dataResponse null
                            //   }
                            // } catch (err) {
                            //   if (kDebugMode) {
                            //     print("Error: $err");
                            //   }
                            //   return []; // Mengembalikan list kosong jika terjadi kesalahan
                            // }
                            // },
                            validator: (value) {
                              if (value == null) {
                                return "* Mahasiswa Harus Di Pilih";
                              }
                              return null;
                            },
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jumlah,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        diperlukan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  WidgetTextForm(
                    number: false,
                    hintText: "Rp",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bukti_transfer,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 16, fontWeight: semiBold),
                      ),
                      Text(
                        diperlukan,
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectDate(context);
                    },
                    child: Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: greyColor2,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: blackColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    jumlah,
                    style: ColorApp.blackTextStyle(context)
                        .copyWith(fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  WidgetTextForm(number: true),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
