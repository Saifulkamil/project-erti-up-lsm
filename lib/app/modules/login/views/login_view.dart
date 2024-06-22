import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:aset_and_properti_up_lsm/app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/component/widget_button_custom.dart';
import '../../../utils/component/widget_text_button.dart';
import '../../../utils/text.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(masuk,
              style: ColorApp.blackTextStyle(context)
                  .copyWith(fontSize: 22, fontWeight: semiBold)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    "assets/image/img_login.png",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "* Password Harus Di Masukan";
                  //   } else if (value.length < 8) {
                  //     return "* Password harus 8 huruf";
                  //   }
                  //   return null;
                  // },
                  autocorrect: false,
                  controller: controller.emailC,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      hintText: Email,
                      labelText: Email,
                      hintStyle: ColorApp.greyTextStyly(context).copyWith(),
                      labelStyle: ColorApp.greyTextStyly(context).copyWith(),
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: Colors.grey,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => TextFormField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "* Password Harus Di Masukan";
                      //   } else if (value.length < 8) {
                      //     return "* Password harus 8 huruf";
                      //   }
                      //   return null;
                      // },
                      autocorrect: false,
                      controller: controller.passC,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isHidden.value,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: greyColor,
                            onPressed: () {
                              controller.isHidden.toggle();
                            },
                            icon: Icon(controller.isHidden.isFalse
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: password,
                          labelText: password,
                          hintStyle: ColorApp.greyTextStyly(context).copyWith(),
                          labelStyle:
                              ColorApp.greyTextStyly(context).copyWith(),
                          prefixIcon: const Icon(Icons.key),
                          prefixIconColor: Colors.grey,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8),
                          )),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: ButtonCustom(
                    onPressed: () {
                      // Get.toNamed(Routes.HOME);
                      authC.login(
                          controller.emailC.text, controller.passC.text);
                    },
                    text: masuk,
                    icon: Icons.login_outlined,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text Belum punya akun
                    Text("Belum punya akun",
                        style: ColorApp.blackTextStyle(context)
                            .copyWith(fontSize: 14, fontWeight: semiBold)),
                    // Button untuk daftar akun baru
                    WidgetTextButton(
                      text: "daftar",
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
