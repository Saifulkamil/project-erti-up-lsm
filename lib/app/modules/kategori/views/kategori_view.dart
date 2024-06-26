import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/asets.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${controller.kategori}",
            style: ColorApp.blackTextStyle(context)
                .copyWith(fontSize: 20, fontWeight: bold),
          ),
        ),
        body: GetX<KategoriController>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: controller.listAset.length,
                itemBuilder: (context, index) {
                  AsetsModel asestModel = controller.listAset[index];
                  return InkWell(
                    onTap: () =>
                        Get.toNamed(Routes.DETAIL_TANAH, arguments: asestModel),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.1, color: greyColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: 225,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 110,
                                      color: colorTransparan,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          "${asestModel.data!.picture}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: greenColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                            asestModel.booking == true
                                                ? "BOOKED":
                                                 "TERSEDIA",
                                            style:
                                                ColorApp.whiteTextStyly(context)
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight: semiBold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(formatter.format(asestModel.data!.harga),
                                    style: ColorApp.greenTextStyly(context)
                                        .copyWith(
                                            fontSize: 15, fontWeight: bold)),
                                Text("${asestModel.data!.lokasi}",
                                    style: ColorApp.blackTextStyle(context)
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold)),
                                Text("${asestModel.data!.alamat}",
                                    style: ColorApp.blackTextStyle(context)
                                        .copyWith(
                                            fontSize: 15, fontWeight: reguler)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${asestModel.data!.jangka_waktu}",
                                        style: ColorApp.blackTextStyle(context)
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                });
          }
        }));
  }
}
