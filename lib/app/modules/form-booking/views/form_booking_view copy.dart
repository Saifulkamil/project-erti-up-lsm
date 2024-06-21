import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_konfirm_aset.dart';
import '../../../utils/component/widget_text_form.dart';
import '../../../utils/text.dart';
import '../controllers/form_booking_controller.dart';

class FormBookingView extends GetView<FormBookingController> {
  const FormBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                form,
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
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            SizedBox(
                              height: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/image/img_tanah.png",
                                ),
                              ),
                            ),
                            Container(
                              height: 80,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(7),
                                    bottomRight: Radius.circular(7)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      colorTransparan,
                                      Colors.black
                                    ]),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 13, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "RP.1.100.234",
                                    style: ColorApp.whiteTextStyly(context)
                                        .copyWith(
                                            fontSize: 18, fontWeight: semiBold),
                                  ),
                                  Text(
                                    "RP.1.100.234",
                                    style: ColorApp.whiteTextStyly(context)
                                        .copyWith(
                                            fontSize: 16, fontWeight: reguler),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              jensi_aset,
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 15, fontWeight: semiBold),
                            ),
                            Text(
                              tanah,
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 15, fontWeight: semiBold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 0.5,
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
                              "RP.1.000.000",
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 15, fontWeight: semiBold),
                            ),
                            Text(
                              tahunan,
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 15, fontWeight: semiBold),
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
                              nama,
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 13, fontWeight: reguler),
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
                                  .copyWith(fontSize: 13, fontWeight: reguler),
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
                        Text(
                          instansi,
                          style: ColorApp.blackTextStyle(context)
                              .copyWith(fontSize: 13, fontWeight: reguler),
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
                              mulai_sewa,
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 13, fontWeight: reguler),
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
                            // projectC.selectDate(context);
                          },
                          child: InkWell(
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
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy').format(
                                              controller.selectedDate.value);
                                      String formattedTime =
                                          '${controller.selectedTime.value.hour}:${controller.selectedTime.value.minute}';
                                      return Text(
                                        "${formattedDate}, ${formattedTime}",
                                        style: ColorApp.blackTextStyle(context)
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: medium),
                                      );
                                    })
                                  ],
                                ),
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
                              jangka_waktu_sewa,
                              style: ColorApp.blackTextStyle(context)
                                  .copyWith(fontSize: 13, fontWeight: reguler),
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    jangka_sewa,
                                    style: ColorApp.blackTextStyle(context)
                                        .copyWith(
                                            fontSize: 16, fontWeight: bold),
                                  ),
                                  Text(
                                    tahunan,
                                    style: ColorApp.blackTextStyle(context)
                                        .copyWith(
                                            fontSize: 12, fontWeight: medium),
                                  ),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
