import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_button_custom.dart';
import '../../../utils/text.dart';
import '../controllers/dashbord_controller.dart';

class DashbordView extends GetView<DashbordController> {
  const DashbordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Aset dan properti lsm'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: Image.asset(
                          "assets/image/img_bumn.png",
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: Image.asset(
                          "assets/image/img_pln.png",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        temukan_aset_dan_properti_kami_untuk_anda_sewa,
                        style: ColorApp.whiteTextStyly(context)
                            .copyWith(fontSize: 12, fontWeight: semiBold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    "assets/image/img_dashboard.png",
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: ButtonCustom(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    text: masuk,
                    icon: Icons.login,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: ButtonCustom(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);

                    },
                    text: daftar,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
