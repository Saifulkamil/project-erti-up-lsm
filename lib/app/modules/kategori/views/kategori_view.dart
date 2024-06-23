import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: controller.streamAsets(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              QuerySnapshot<Map<String, dynamic>> querySnapshot =
                  snapshot.data!;
              List<DocumentSnapshot<Map<String, dynamic>>> documents =
                  querySnapshot.docs;

              List<AsetsModel> allAsets = [];
              documents.forEach((doc) {
                Map<String, dynamic>? data = doc.data();
                String documentId = doc.id; // Get document ID

                // Convert data to AsetDetails
                AsetDetails asetDetails = AsetDetails.fromJson(data!);

                // Create AsetsModel
                AsetsModel asetsModel =
                    AsetsModel(docId: documentId, data: asetDetails);
                print(asetDetails.kategori);
                if (asetDetails.kategori == "${controller.kategori}") {
                  allAsets.add(asetsModel);
                }
              });
              return ListView.builder(
                  itemCount: allAsets.length,
                  itemBuilder: (context, index) {
                    AsetsModel asestModel = allAsets[index];
                    return InkWell(
                      onTap: () => Get.toNamed(Routes.DETAIL_TANAH,
                          arguments: asestModel),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.1, color: greyColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              height: 225,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 110,
                                        color: colorTransparan,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                              "Tersedia",
                                              style: ColorApp.whiteTextStyly(
                                                      context)
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
                                              fontSize: 15,
                                              fontWeight: reguler)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("${asestModel.data!.jangka_waktu}",
                                          style:
                                              ColorApp.blackTextStyle(context)
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
            }));
  }
}
