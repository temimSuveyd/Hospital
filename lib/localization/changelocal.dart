import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/APPtheme.dart';
import '../core/constant/color.dart';
import '../services/servieses.dart';

class Localcontroller extends GetxController {
  late Locale language;
  bool isDarkMode = false; // الوضع الافتراضي
  ThemeData? appTheme;
  Services services = Get.find();

  // تغيير الثيم
  void changeTheme(bool darkMode) {
    isDarkMode = darkMode;
    appTheme = darkMode ? themearabicDark : themearabic;
    services.sharedPreferences.setBool("darkMode", darkMode);
    Get.changeTheme(appTheme!);
    update();
  }

  // عرض نافذة اختيار اللغة
  void showLanguageDialog() {
    Get.defaultDialog(
      title: "Change Language".tr,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.language, color: Appcolor.primarycolor),
            title: Text("English".tr),
            onTap: () {
              _changeLanguage(const Locale('en', 'US'));
            },
          ),
          ListTile(
            leading: Icon(Icons.language, color: Appcolor.primarycolor),
            title: Text("العربية".tr),
            onTap: () {
              _changeLanguage(const Locale('ar', 'SA'));
            },
          ),
        ],
      ),
    );
  }

  // تحديث اللغة وتخزينها
  void _changeLanguage(Locale locale) {
    Get.updateLocale(locale);
    services.sharedPreferences.setString("lang", locale.languageCode);
    Get.back(); // إغلاق نافذة الحوار
    update();
    Get.offAllNamed(Get.currentRoute);
  }

  @override
  void onInit() {
    super.onInit();

    // استرجاع اللغة والثيم من التخزين
    String? lang = services.sharedPreferences.getString("lang");
    bool? savedDarkMode = services.sharedPreferences.getBool("darkMode");

    if (lang == "ar") {
      language = const Locale("ar");
      appTheme = savedDarkMode == true ? themearabicDark : themearabic;
    } else if (lang == "en") {
      language = const Locale("en");
      appTheme = savedDarkMode == true ? themeEnglishDark : themeEnglish;
    } else {
      language = Locale(Get.deviceLocale?.languageCode ?? 'en');
      appTheme = themeEnglish;
    }

    isDarkMode = savedDarkMode ?? false; // استرجاع وضع الثيم
    Get.changeTheme(appTheme!);
  }
}
