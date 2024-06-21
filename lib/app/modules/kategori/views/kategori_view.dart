import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/text.dart';
import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('KategoriView',
          style: ColorApp.blackTextStyle(context)
                .copyWith(fontSize: 20, fontWeight: bold),),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: greyColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    height: 215,
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
                                child: Image.asset(
                                  "assets/image/img_vocaject.png",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, top: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "sdfsdfsdfsd",
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
                        Text("RP1.000.200",
                            style: ColorApp.greenTextStyly(context)
                                .copyWith(fontSize: 15, fontWeight: bold)),
                        Text(aset_tersedia,
                            style: ColorApp.blackTextStyle(context)
                                .copyWith(fontSize: 16, fontWeight: semiBold)),
                        Text(aset_tersedia,
                            style: ColorApp.blackTextStyle(context)
                                .copyWith(fontSize: 15, fontWeight: reguler)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("TAHUNAN",
                                style: ColorApp.blackTextStyle(context)
                                    .copyWith(fontSize: 16, fontWeight: bold)),
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
            );
          }
        ));
  }
}
