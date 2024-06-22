import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_button_custom.dart';
import '../../../utils/text.dart';
import '../controllers/detail_tanah_controller.dart';

class DetailTanahView extends GetView<DetailTanahController> {
  const DetailTanahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(masuk,
              style: ColorApp.blackTextStyle(context)
                  .copyWith(fontSize: 22, fontWeight: semiBold)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "${controller.asestdetail!.picture}",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.asestdetail!.title}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.blackTextStyle(context)
                          .copyWith(fontSize: 16, fontWeight: bold),
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
                          lokasi,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: semiBold),
                        ),
                        Text(
                          "${controller.asestdetail!.lokasi}",
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          alamat,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: semiBold),
                        ),
                        Text(
                          "${controller.asestdetail!.alamat}",
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kabupaten,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: semiBold),
                        ),
                        Text(
                          "${controller.asestdetail!.kabupaten}",
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
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
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: semiBold),
                        ),
                        Text(
                          formatter.format(controller.asestdetail!.harga),
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonCustom(
                  onPressed: () {
                    Get.toNamed(Routes.FORM_BOOKING, arguments: controller.asestdetail);
                  },
                  text: booking_sekaran,
                  icon: Icons.login_outlined,
                ),
              ],
            ),
          ),
        ));
  }
}
