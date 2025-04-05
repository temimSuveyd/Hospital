import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showLanguageDialog();
      },
      child: Text("Change Language".tr),
    );
  }

  void showLanguageDialog() {
    Get.defaultDialog(
      title: "Change Language".tr,
      content: Column(
        children: [
          ListTile(
            title: Text("English".tr),
            onTap: () {
              Get.updateLocale(Locale('en', 'US'));
              Get.back(); // إغلاق الـ Dialog بعد التغيير
            },
          ),
          ListTile(
            title: Text("العربية".tr),
            onTap: () {
              Get.updateLocale(Locale('ar', 'SA'));
              Get.back(); // إغلاق الـ Dialog بعد التغيير
            },
          ),
        ],
      ),
    );
  }
}
