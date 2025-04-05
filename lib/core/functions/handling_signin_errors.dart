import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';

void handling_sigin_errors(FirebaseAuthException e) {
  String errorMessage;
  switch (e.code) {
    case 'invalid-credential':
      errorMessage =
          'The supplied auth credential is incorrect, malformed or has expired';
      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

      break;
    case 'user-not-found':
      errorMessage = 'No user found with this email address';

      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));

      break;
    case 'wrong-password':
      errorMessage = 'Incorrect password, please try again';
      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
      break;
    case 'invalid-email':
      errorMessage = 'The email address is invalid';
      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
      break;
    case 'user-disabled':
      errorMessage = 'This account has been disabled';
      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
      break;
    case 'too-many-requests':
      errorMessage = 'Too many attempts, please try again later';
      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
      break;
    case 'operation-not-allowed':
      errorMessage = 'Email/password sign-in is not enabled';
      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: errorMessage,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
      break;
    default:
      errorMessage = 'Sign-in failed: ${e.message}';
  }
}
