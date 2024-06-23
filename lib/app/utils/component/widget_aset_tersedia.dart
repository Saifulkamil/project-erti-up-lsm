import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/asets.dart';
import '../../modules/home/controllers/home_controller.dart';

// ignore: must_be_immutable
class WidgetAsetTersedia extends StatelessWidget {
  HomeController? homeController;
  WidgetAsetTersedia({
    required this.homeController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: homeController!.streamAsets(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            QuerySnapshot<Map<String, dynamic>> querySnapshot = snapshot.data!;
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

              allAsets.add(asetsModel);
            });
            // for (var element in snapshot.data!.docs) {}
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allAsets.length,
                itemBuilder: (context, index) {
                  AsetsModel asestModel = allAsets[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_TANAH,
                              arguments: asestModel);
                        },
                        child: AsetTersedia(
                          asestModel: asestModel,
                        )),
                  );
                });
          }),
    );
  }
}

// ignore: must_be_immutable
class AsetTersedia extends StatelessWidget {
  AsetsModel? asestModel;
  AsetTersedia({
    required this.asestModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            Container(
              width: 335,
              height: 110,
              color: colorTransparan,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "${asestModel!.data!.picture}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: greenColor, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Tersedia",
                    style: ColorApp.whiteTextStyly(context)
                        .copyWith(fontSize: 12, fontWeight: semiBold),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text("${asestModel!.data!.alamat}",
            style: ColorApp.blackTextStyle(context)
                .copyWith(fontSize: 17, fontWeight: bold)),
        Text(formatter.format(asestModel!.data!.harga),
            style: ColorApp.blackTextStyle(context)
                .copyWith(fontSize: 15, fontWeight: medium)),
      ],
    );
  }
}
