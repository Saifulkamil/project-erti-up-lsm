import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_button_custom.dart';
import '../../../utils/text.dart';
import '../controllers/panduan_pay_controller.dart';

class PanduanPayView extends GetView<PanduanPayController> {
  const PanduanPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: controller.streamImagepay(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: greenColor,
                ));
              }
              snapshot.data!.docs;
              String? link;
              for (var element in snapshot.data!.docs) {
                link = element.data()["link"];
              }
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      metode_pay,

                      // "${controller.ordersModel!.docId}",
                      style: ColorApp.greenTextStyly(context)
                          .copyWith(fontSize: 18, fontWeight: semiBold),
                    ),
                    leading: IconButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.HOME);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Container(
                                color: greenColor,
                                height: 500,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    "$link",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                panduan_pembayara,
                                maxLines: 1,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(
                                        fontSize: 18, fontWeight: extraBold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                panduan_no1,
                                maxLines: 3,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(
                                        fontSize: 16, fontWeight: reguler),
                              ),
                              Text(
                                panduan_no2,
                                maxLines: 3,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(
                                        fontSize: 16, fontWeight: reguler),
                              ),
                              Text(
                                panduan_no3,
                                maxLines: 3,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(
                                        fontSize: 16, fontWeight: reguler),
                              ),
                              Text(
                                panduan_terakhir,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(fontSize: 16, fontWeight: medium),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                panduan_deskripsi,
                                textAlign: TextAlign.center,
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(
                                        fontSize: 16, fontWeight: reguler),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ButtonCustom(
                                text: konfirmasi_bayar,
                                onPressed: () {
                                  Get.toNamed(Routes.KONFIRM_PAY,
                                      arguments: controller.ordersModel);
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }));
  }
}
