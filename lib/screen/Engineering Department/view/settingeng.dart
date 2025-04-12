import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/color.dart';
import '../../../controller/Engineering Department/settingengineer_controller.dart';
import '../../../controller/user/setting_user_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/customdialog.dart';
import '../../user/widget/customappbaruser.dart';
import '../../user/widget/setting/custombottomlogout.dart';
import '../../user/widget/setting/customlisttile.dart';

class SettingsScreenEng extends StatelessWidget {
  SettingsScreenEng({super.key});

  final SettingengineerController controller =
      Get.put(SettingengineerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
        body: Column(
        
        children: [
          SizedBox(height: 20.h),
          Customappbaruser(title: 'Setting'.tr),
          SizedBox(height: 20.h),
        
          /// **🔹 إعدادات اللغة**
          CustomListTile(
            title: "Language".tr,
            icon: Icons.language,
            onTap: () =>
        local_controller.showLanguageDialog()
        
            ),
        
          /// **🔹 إعدادات الحساب**
          CustomListTile(title: "Profile".tr, icon: Icons.person, onTap: () {
            controller.gotoprofileengineer();
          },),
          CustomListTile(title: "Password".tr, icon: Icons.lock, onTap: () {
            controller.goToPassword();
          },),
        
          /// **🔹 التبديل بين الوضع الداكن والفاتح**
          SwitchListTile(
            title: Text(
              "Dark Mode".tr,
              style: TextStyle(fontSize: 13.sp, fontFamily: "Cairo", fontWeight: FontWeight.w600),
            ),
            activeColor: Colors.blue,
            value: local_controller.isDarkMode,
            onChanged: (value) {
              local_controller.changeTheme(value,);
            },
          ),
        
          SizedBox(height: 50.h),
        
          /// **🔹 زر تسجيل الخروج**
          Custombottomlogout(onPressed: () {
            controller.logOut();
          },),
          // SizedBox(height: 10.h),
        ],
                ),
      ),
    );
  }
}
