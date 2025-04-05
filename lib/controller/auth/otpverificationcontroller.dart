import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:hosptail/core/constant/Approutes.dart';

abstract class OTPVerificationController extends GetxController {
  startResendTimer();
  verifyOTP();
  gotoressetpassword();
  initData();
  signInWithPhoneCredential(PhoneAuthCredential credential);
}

class OTPVerificationControllerImp extends OTPVerificationController {
  late TextEditingController otpController;
  RxInt resendTime = 59.obs;
  RxBool isResending = false.obs;
  Timer? _timer;
  String? phoneNumber;
  String? verificationId;

  @override
  initData() {
    phoneNumber = Get.arguments["phoneNumber"];
    verificationId = Get.arguments["verificationId"];
    log("verificationId: $verificationId");
  }

  void startResendTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTime.value > 0) {
        resendTime.value--;
      } else {
        isResending.value = true;
        _timer?.cancel();
      }
    });
  }

  void verifyOTP() async {
    String otp = otpController.text.trim();
    if (otpController.text.isEmpty) {
      Get.snackbar("Error", "Please enter the OTP code",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } else {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!,
          smsCode: "${otp}11",
        );
        signInWithPhoneCredential(credential);
      } on FirebaseAuthException catch (e) {
        Get.showSnackbar(GetSnackBar(
          title: "Error",
        ));
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          title: "Error",
          message: e.toString(),
        ));
      }
    }
  }

  gotoressetpassword() {
    Get.toNamed(Approutes.respassword);
  }



  Future<void> signInWithPhoneCredential(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Get.toNamed(Approutes.userNotificationPage);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: "${e.code} - ${e.message}",
      ));
    }
  }

  @override
  void onInit() {
    initData();
    otpController = TextEditingController();
    startResendTimer();
    super.onInit();
  }
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }}
