import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aset_and_properti_up_lsm/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/colors.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore authFirestore = FirebaseFirestore.instance;
  Stream<User?> streamAuthStatus() {
    return auth.authStateChanges();
  }

  void toast(String warning) {
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

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        toast('Email tidak terverifikasi');
      }
    } on FirebaseAuthException catch (e) {
      toast('No user found for that email.');
    }
  }

  Future<void> signup(String email, String password) async {
    CollectionReference users = authFirestore.collection('users');
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      toast('Cek email anda untuk verikasi');
      await users
          .doc(email).set({
            'email': email,
            'password': password,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      Timer(const Duration(milliseconds: 2000), () async {
        Get.offAllNamed(Routes.LOGIN);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toast(
            'The password provided is too weak.\nPassword should be at least 6 characters');
      } else if (e.code == 'email-already-in-use') {
        toast('The account already exists for that email.');
      }
    } catch (e) {
      toast('Tolong masukan email dan password');
      print(e);
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
