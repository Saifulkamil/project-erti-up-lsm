import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:aset_and_properti_up_lsm/app/utils/text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/component/widget_konfirm_aset.dart';
import '../controllers/status_booking_controller.dart';

class StatusBookingView extends GetView<StatusBookingController> {
  const StatusBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            status_booking,
            style: ColorApp.blackTextStyle(context)
                .copyWith(fontSize: 20, fontWeight: bold),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Card(
                              elevation: 5,
                              color: whiteMain,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                title: Text(
                                  "{listmahasiswa.name}",
                                  style: ColorApp.greenTextStyly(context)
                                      .copyWith(fontSize: 17, fontWeight: bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "listmahasiswa.nim}",
                                      style: ColorApp.blackTextStyle(context)
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: semiBold),
                                    ),
                                    Text(
                                      "listmahasiswa.nim}",
                                      style: ColorApp.blackTextStyle(context)
                                          .copyWith(
                                              fontSize: 12,
                                              fontWeight: reguler),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]));
            }));
  }
}
