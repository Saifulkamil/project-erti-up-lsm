import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_button_custom.dart';
import '../../../utils/component/widget_konfirm_aset.dart';
import '../../../utils/component/widget_text_form.dart';
import '../../../utils/text.dart';
import '../controllers/form_booking_controller.dart';

class DetailPayView extends GetView<FormBookingController> {
  const DetailPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                metode_pay,
                style: ColorApp.greenTextStyly(context)
                    .copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              pinned: true,
              actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        builder: (BuildContext context) {
                          return const WidgetkonfirmAset();
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.check,
                      color: greenColor,
                    ))
              ],
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
                            child: Image.asset(
                              "assets/image/img_tanah.png",
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
                              .copyWith(fontSize: 18, fontWeight: extraBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          panduan_no1,
                          maxLines: 3,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: reguler),
                        ),
                        Text(
                          panduan_no2,
                          maxLines: 3,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: reguler),
                        ),
                        Text(
                          panduan_no3,
                          maxLines: 3,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 16, fontWeight: reguler),
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
                              .copyWith(fontSize: 16, fontWeight: reguler),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonCustom(
                          text: konfirmasi_bayar,
                          onPressed: () {
                            Get.toNamed(Routes.KONFIRM_PAY);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
