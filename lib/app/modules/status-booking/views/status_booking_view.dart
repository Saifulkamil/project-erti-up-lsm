import 'package:aset_and_properti_up_lsm/app/models/orders.dart';
import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:aset_and_properti_up_lsm/app/utils/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/component/widget_konfirm_aset.dart';
import '../controllers/status_booking_controller.dart';

class StatusBookingView extends GetView<StatusBookingController> {
  const StatusBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
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
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: controller.streamAsets(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              List<OrdersModel> allOrders = [];

              for (var element in snapshot.data!.docs) {
                if (element.data()["orders_users"]["email"] ==
                    controller.authC.email) {
                  allOrders.add(OrdersModel.fromJson(element.data()));
                }
              }
              return ListView.builder(
                  itemCount: allOrders.length,
                  itemBuilder: (context, index) {
                    OrdersModel ordersModel = allOrders[index];

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
                                      return WidgetkonfirmAset(
                                        ordersModel: ordersModel,
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Card(
                                    elevation: 5,
                                    color: whiteMain,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: ListTile(
                                      title: Text(
                                        "${ordersModel.ordersAset!.title}",
                                        style: ColorApp.greenTextStyly(context)
                                            .copyWith(
                                                fontSize: 18, fontWeight: bold),
                                      ),
                                      trailing:
                                          ordersModel.statusPembayaran == true
                                              ? const Icon(
                                                  Icons.check_circle,
                                                  size: 30,
                                                  color:Colors.green,
                                                )
                                              : const Icon(
                                                  Icons.timelapse_outlined,
                                                  color: Colors.orange,
                                                  size: 30,
                                                ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${ordersModel.name}",
                                            style:
                                                ColorApp.blackTextStyle(context)
                                                    .copyWith(
                                                        fontSize: 15,
                                                        fontWeight: semiBold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            formatter.format(
                                                ordersModel.totalPembayaran),
                                            style:
                                                ColorApp.blackTextStyle(context)
                                                    .copyWith(
                                                        fontSize: 15,
                                                        fontWeight: reguler),
                                          ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]));
                  });
            }));
  }
}
