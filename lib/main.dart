import 'package:aset_and_properti_up_lsm/app/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/utils/component/widget_loading_view.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController(), permanent: true);
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              title: "Application",
              initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true? AppPages.INITIAL : Routes.DASHBORD,
              getPages: AppPages.routes,
            );
          }
          return const WidgetLoadingView();
        });
  }
}
