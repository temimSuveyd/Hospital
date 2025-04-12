import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';

void handling_login_errors(FirebaseAuthException e) {
  String errorMessage;
  switch (e.code) {
    case 'weak-password':
      errorMessage = 'Password too weak (min 6 chars)'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'invalid-email':
      errorMessage = 'Invalid email format'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'email-already-in-use':
      errorMessage = 'Email already registered'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'operation-not-allowed':
      errorMessage = 'Email login is not enabled'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'network-request-failed':
      errorMessage = 'Network error. Check your connection.'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    default:
      errorMessage = 'log-in failed: ${e.message}';
  }
}
