import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/servieses.dart';
import '../../../core/constant/APPtheme.dart';

class SettingcontractorController extends GetxController {
  final Services services = Get.find();

  gotoprofile() {
    Get.toNamed(Approutes.contractorProfile);
  }

  void logOut() {
    Get.offAllNamed(Approutes.login);
    services.sharedPreferences.clear();
  }

  goToPassword() {
    Get.toNamed(Approutes.forgetpasword);
  }
}
