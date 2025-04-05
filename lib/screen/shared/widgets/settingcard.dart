import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';
import '../../user/widget/customappbaruser.dart';
import '../../user/widget/setting/custombottomlogout.dart';
import '../../user/widget/setting/customlisttile.dart';
import 'customdialog.dart';


class SettingsCard extends StatelessWidget {
  final VoidCallback onProfileTap;
  final VoidCallback onPasswordTap;
  final VoidCallback onLogout;

  const SettingsCard({
    super.key,
    required this.onProfileTap,
    required this.onPasswordTap,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controllerloc) => Card(
        
        elevation: 6,
        color:   controllerloc.isDarkMode ? Appcolor.colorbackground: Colors.white,
        shadowColor: Colors.blue.shade300,
        margin: EdgeInsets.only(bottom: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(
            color: controllerloc.isDarkMode ? Colors.blue : Appcolor.primarycolor, // ✅ لون الإطار
            width: 2, // ✅ سمك الإطار
          ),
        ),
        child: Column(
          
          children: [
            SizedBox(height: 20.h),
            Customappbaruser(title: 'Setting'.tr),
            SizedBox(height: 20.h),

            /// **🔹 إعدادات اللغة**
            CustomListTile(
              title: "Language".tr,
              icon: Icons.language,
              onTap: () =>
          controllerloc.showLanguageDialog()

    ),

            /// **🔹 إعدادات الحساب**
            CustomListTile(title: "Profile".tr, icon: Icons.person, onTap: onProfileTap),
            CustomListTile(title: "Password".tr, icon: Icons.lock, onTap: onPasswordTap),

            /// **🔹 التبديل بين الوضع الداكن والفاتح**
            SwitchListTile(
              title: Text(
                "Dark Mode".tr,
                style: TextStyle(fontSize: 13.sp, fontFamily: "Cairo", fontWeight: FontWeight.w600),
              ),
              activeColor: Colors.blue,
              value: controllerloc.isDarkMode,
              onChanged: (value) {
                controllerloc.changeTheme(value);
              },
            ),

            SizedBox(height: 50.h),

            /// **🔹 زر تسجيل الخروج**
            Custombottomlogout(onPressed: onLogout),
            // SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
