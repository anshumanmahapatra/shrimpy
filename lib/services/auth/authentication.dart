import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widgets/alert_dialog.dart';
import '../../screens/home/pseudo_home.dart';
import '../../services/storage/storage.dart';
import '../../controller/auth_controller.dart';
import '../../screens/home/home.dart';

class Authentication {
  AuthController authController = Get.put(AuthController());
  Home home = Get.put(const Home());
  PseudoHome pseudoHome = Get.put(const PseudoHome());
  ShowAlertDialog alertDialog = Get.put(ShowAlertDialog());

  FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  Future phoneAuth(String phoneNumber) async {
    authController.showLoading(true);

    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          authController.showLoading(false);
        },
        verificationFailed: (verificationFailed) async {
          authController.showLoading(false);
          Get.dialog(AlertDialog(
            title: const Text("Error"),
            content: Text(verificationFailed.message.toString()),
            actions: [
              ElevatedButton(
                child: const Text("Ok"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ));
        },
        codeSent: (verificationId, resendingToken) async {
          authController.showLoading(false);
          authController.isOTPSent(true);
          authController.assignVerificationId(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  Future authenticatePhoneUser(String otp) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: authController.verificationId.value, smsCode: otp);

    authController.showLoading(true);

    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      authController.showLoading(false);

      if (authCredential.user != null) {
        debugPrint("Before writing data: " + box.read("uid").toString());
        box.write("uid", authCredential.user!.uid.toString());
        debugPrint("After writing data: " + box.read("uid").toString());
        Get.off(() => home);
        authController.isOTPSent(false);
      }
    } on FirebaseAuthException catch (e) {
      authController.showLoading(false);

      Get.dialog(alertDialog.showAlertDialog(e.message.toString()));
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      authController.showGoogleLoading(true);

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      UserCredential result = await auth.signInWithCredential(credential);
      User? user = result.user;

      authController.showGoogleLoading(false);

      if (result.user != null) {
        debugPrint("Before writing data: " + box.read("uid").toString());
        box.write("uid", user!.uid.toString());
        debugPrint("After writing data: " + box.read("uid").toString());
        Get.off(() => home);
      }
    } on FirebaseAuthException catch (e) {
      Get.dialog(alertDialog.showAlertDialog(e.message.toString()));
    }
  }

  Future signOut() async {
    User? user = auth.currentUser;
    debugPrint("Service Provider: " + user!.providerData[0].providerId);
    if (user.providerData[0].providerId == 'google.com') {
      await googleSignIn.disconnect();
    }
    await auth.signOut();
    debugPrint("Before signing out: " + box.read("uid").toString());
    box.remove("uid");
    debugPrint("After signing out: " + box.read("uid").toString());
    Get.off(() => pseudoHome);
  }
}
