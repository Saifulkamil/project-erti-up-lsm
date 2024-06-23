import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_konfirm_bayar.dart';
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
                    if (controller.formkey.currentState!.validate()) {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          builder: (BuildContext context) {
                            return  WidgetkonfirmBayar(konfirmPayController: controller,);
                          },
                        );
                    }
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
              child: Form(
                key: controller.formkey,
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.date_range_sharp,
                                color: blackColor,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Obx(() {
                                String formattedDate = DateFormat('dd-MM-yyyy')
                                    .format(controller.selectedDate.value);

                                return Text(
                                  formattedDate,
                                  style: ColorApp.blackTextStyle(context)
                                      .copyWith(
                                          fontSize: 18, fontWeight: medium),
                                );
                              })
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
                              .copyWith(fontSize: 16, fontWeight: reguler),
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
                        number: true,
                        textControllet: controller.namaC,
                        validasiText: "* Nama harus di masukan"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nohp,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: reguler),
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
                        textControllet: controller.phoneC,
                        validasiText: "* NO HP harus di masukan"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nama_rekening_pengirim,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: reguler),
                        ),
                        Text(
                          diperlukan,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 12, fontWeight: reguler),
                        ),
                      ],
                    ),
                    WidgetTextForm(
                        number: true,
                        textControllet: controller.namaRekeningPengirimC,
                        validasiText: "* Nama Rek harus di masukan"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          bank_pengirim,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: reguler),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
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
                              items: const [
                                "BANK SYARIAH INDONESIA",
                                "BANK ACEH",
                                "BANK CENTRAL ASIA",
                                "BANK NEGARA INDONESIA",
                                "BANK REPUBLIK INDONESIA",
                                "BANK JAGO",
                                "MANDIRI",
                              ],
                              onChanged: (value) {
                                controller.namaBank = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "* BANK PENGIRIM Harus Di Pilih";
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
                              .copyWith(fontSize: 16, fontWeight: reguler),
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
                        textControllet: controller.jumlahHargaC,
                        validasiText: "* Jumlah Harga harus di masukan"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          bukti_transfer,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: reguler),
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
                      onTap: () async {
                        controller.pilihfoto();
                      },
                      child: Container(
                        height: 52,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: greyColor2,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.image_outlined,
                                size: 35,
                                color: greyColor,
                              ),
                              Obx(() => Flexible(
                                    child: Text(
                                      controller.isImagePayment.value == true
                                          ? controller.imagePathPayment.value
                                          : pilih_sebuah_gambar,
                                      overflow: TextOverflow.ellipsis,
                                      style: controller.isImagePayment.value
                                          ? ColorApp.blackTextStyle(context)
                                              .copyWith(
                                                  fontSize: 17,
                                                  fontWeight: medium)
                                          : TextStyle(
                                              fontSize: 17,
                                              fontWeight: medium,
                                              color:
                                                  greyColor, // Warna merah untuk menunjukkan validasi
                                            ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "PESAN",
                      style: ColorApp.blackTextStyle(context)
                          .copyWith(fontSize: 16, fontWeight: reguler),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    WidgetTextForm(
                      number: true,
                      textControllet: controller.pesanC,
                      hintText: "OPTIONAL",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
