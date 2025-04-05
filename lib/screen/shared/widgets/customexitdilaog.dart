import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import '../../../localization/changelocal.dart';

class ExitDialogHelper {
  // ✅ دالة لإظهار مربع حوار الخروج
  static void showExitDialog() {
    final Localcontroller controllerloc = Get.find<Localcontroller>();

    Get.defaultDialog(
      title: "تحذير".tr,
      middleText: "هل تريد الخروج من التطبيق؟".tr,
      middleTextStyle: TextStyle(
        color: Appcolor.black,
        fontSize: 15.h,
        fontFamily: "cairo",
        fontWeight: FontWeight.bold,
      ),
      confirmTextColor:
      controllerloc.isDarkMode ? Appcolor.white : Appcolor.black,
      cancelTextColor:
      controllerloc.isDarkMode ? Appcolor.white : Appcolor.black,
      buttonColor: Appcolor.primarycolor,
      titleStyle:  TextStyle(color: Appcolor.primarycolor),
      onConfirm: () => exit(0), // إنهاء التطبيق
      onCancel: () {}, // إغلاق الحوار بدون إجراء
    );
  }
}
