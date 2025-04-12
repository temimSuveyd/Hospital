import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/screen/shared/widgets/customappbar.dart';
import 'package:hosptail/screen/user/widget/setting/custombottomlogout.dart';
import 'package:hosptail/screen/user/widget/setting/customlisttile.dart';
import '../../../controller/user/setting_user_controller.dart';
import '../../../localization/changelocal.dart';

class SettingsScreen extends GetView<SettingsControllerImp> {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    return GetBuilder<Localcontroller>(
        builder: (local_controller) => Scaffold(
              appBar: Customappbar(title: "Settings".tr),
              backgroundColor: local_controller.isDarkMode
                  ? Appcolor.colorcarddark
                  : Appcolor.white,
              body: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  /// **🔹 إعدادات اللغة**
                  CustomListTile(
                      title: "Language".tr,
                      icon: Icons.language,
                      onTap: () => local_controller.showLanguageDialog()),

                  /// **🔹 إعدادات الحساب**
                  CustomListTile(
                    title: "Profile".tr,
                    icon: Icons.person,
                    onTap: () {
                      controller.gotoprofile();
                    },
                  ),
                  CustomListTile(
                    title: "Password".tr,
                    icon: Icons.lock,
                    onTap: () {
                      controller.goToPassword();
                    },
                  ),

                  /// **🔹 التبديل بين الوضع الداكن والفاتح**
                  SwitchListTile(
                    title: Text(
                      "Dark Mode".tr,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w600),
                    ),
                    activeColor: Colors.blue,
                    value: local_controller.isDarkMode,
                    onChanged: (value) {
                      local_controller.changeTheme(
                        value,
                      );
                    },
                  ),

                  SizedBox(height: 50.h),

                  /// **🔹 زر تسجيل الخروج**
                  Custombottomlogout(
                    onPressed: () {
                      controller.logOut();
                    },
                  ),
                  // SizedBox(height: 10.h),
                ],
              ),
            ));
  }
}
