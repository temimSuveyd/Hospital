import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';

class ResetpasswordController extends GetxController {
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isPasswordVisible2 = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void togglePasswordVisibility2() {
    isPasswordVisible2.value = !isPasswordVisible2.value;
  }

  gotoforgetpassword(){
    Get.toNamed(Approutes.forgetpasword);
  }
}
