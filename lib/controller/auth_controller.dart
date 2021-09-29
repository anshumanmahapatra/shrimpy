import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/storage/storage.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isGoogleLoading = false.obs;
  var verificationId = "".obs;
  var phoneNumber = "".obs;
  var otpSent = false.obs;

  @override
  void onInit() {
    isUserLoggedIn();
    super.onInit();
  }

  void assignVerificationId(String id) {
    verificationId.value = id;
  }

  void assignPhoneNumber(String number) {
    phoneNumber.value = "+91" + number;
  }

  void isOTPSent(bool val) {
    otpSent.value = val;
  }

  void showLoading(bool val) {
    isLoading.value = val;
  }

  void showGoogleLoading(bool val) {
    isGoogleLoading.value = val;
  }

  Future<bool> isUserLoggedIn() async {
    debugPrint("Data when first initialised: " + box.read("uid").toString());
    if (box.hasData("uid")) {
      return true;
    } else {
      return false;
    }
  }
}
