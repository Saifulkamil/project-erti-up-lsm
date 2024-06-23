import 'dart:async';
import 'package:aset_and_properti_up_lsm/app/utils/component/widget_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/colors.dart';

class AuthController extends GetxController {
  final loading = WidgetLoading();
  String? email;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore authFirestore = FirebaseFirestore.instance;
  Stream<User?> streamAuthStatus() {
    return auth.authStateChanges();
  }

  void toasterror(String warning) {
    Fluttertoast.showToast(
      msg: warning,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: redcolor,
      textColor: whiteMain,
      fontSize: 15.0,
    );
  }

  void toastsucces(String warning) {
    Fluttertoast.showToast(
      msg: warning,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: whiteMain,
      fontSize: 15.0,
    );
  }

  Future<void> login(String email, String password) async {
    try {
      loading.loading(Get.overlayContext!);
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        toasterror('Email tidak terverifikasi');
        Get.back();
      }
    } on FirebaseAuthException {
      toasterror('No user found for that email.');
      Get.back();
    }
  }

  Future<void> signup(String email, String password) async {
    CollectionReference users = authFirestore.collection('users');

    try {
      loading.loading(Get.overlayContext!);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      if (userCredential.additionalUserInfo!.isNewUser) {
        await users.doc(email).set({
          'email': email,
        }).then((value) {
          toastsucces('Cek email anda untuk verikasi');
          Timer(const Duration(milliseconds: 1000), () {
            Get.offAllNamed(Routes.LOGIN);
          });
        }).catchError((error) { if (kDebugMode) {
          print("Failed to add user: $error");
        }});
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toasterror(
            'The password provided is too weak.\nPassword should be at least 6 characters');
        Get.back();
      } else if (e.code == 'email-already-in-use') {
        toasterror('The account already exists for that email.');
        Get.back();
      }
    } catch (e) {
      toasterror('Tolong masukan email dan password');
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
