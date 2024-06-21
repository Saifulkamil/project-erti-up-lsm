import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:aset_and_properti_up_lsm/app/utils/component/widget_button_custom.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_aset_tersedia.dart';
import '../../../utils/component/widget_kategori_poject.dart';
import '../../../utils/text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: const Center(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: Image.asset(
                  "assets/image/img_vocaject.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(kategori,
                  style: ColorApp.blackTextStyle(context)
                      .copyWith(fontSize: 16, fontWeight: semiBold)),
              const SizedBox(
                height: 10,
              ),
              const WidgetKategoriPoject(),
              const SizedBox(
                height: 10,
              ),
              Text(aset_tersedia,
                  style: ColorApp.blackTextStyle(context)
                      .copyWith(fontSize: 16, fontWeight: semiBold)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 165,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_TANAH);
                            },
                            child: const AsetTersedia()),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 45,
          child: ButtonCustom(
            text: status_booking,
            onPressed: () {
              Get.toNamed(Routes.STATUS_BOOKING);
            },
          ),
        ),
      ),
    );
  }
}
