import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';

void handlingetPassword_errors(FirebaseAuthException e) {
  String errorMessage;
  switch (e.code) {
    case 'invalid-email':
      errorMessage = 'Invalid email format'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'user-not-found':
      errorMessage = 'No user found with this email'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'missing-android-pkg-name':
      errorMessage = 'EAndroid package name missing'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'missing-continue-uri':
      errorMessage = 'Continue URL missing'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
    case 'missing-ios-bundle-id':
      errorMessage = 'iOS bundle ID missing'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
    case 'invalid-continue-uri':
      errorMessage = 'Invalid continue URL'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    case 'unauthorized-continue-uri':
      errorMessage = 'Unauthorized domain for continue URL'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
    case 'network-request-failed':
      errorMessage = 'Network error occurred'.tr;

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

    default:
      errorMessage = 'forget password failed'.tr;
  }
}
