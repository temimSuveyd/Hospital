import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import 'package:hosptail/screen/user/widget/setting/custombottomlogout.dart';
import 'package:hosptail/screen/user/widget/setting/customlisttile.dart';
import '../../../controller/Contractor/settingcontractor_controller.dart';
import '../../../localization/changelocal.dart';

class Settingcontractor extends StatelessWidget {
  Settingcontractor({super.key});

  final SettingcontractorController controller =
      Get.put(SettingcontractorController());
  final Localcontroller controllerloc = Get.put(Localcontroller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
        appBar: CustomAppBarApp(title: 'Setting'.tr),
        body: Column(
          children: [
            SizedBox(height: 20.h),

            /// **🔹 إعدادات اللغة**
            CustomListTile(
                title: "Language".tr,
                icon: Icons.language,
                onTap: () => controllerloc.showLanguageDialog()),

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
              value: controllerloc.isDarkMode,
              onChanged: (value) {
                controllerloc.changeTheme(
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
      ),
    );
  }
}
