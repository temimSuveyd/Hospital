import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import '../../../core/constant/Approutes.dart';
import '../widgets/auth/customchooseLoginButton.dart';
import '../widgets/customappbarapp.dart';



class ChooseLoginPage extends StatelessWidget {
  const ChooseLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarApp(title: 'choose_login_method'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 30.h),

            // زر المستخدم
            CustomchooseLoginButton(
              title: 'login_as_user'.tr,
              color: Appcolor.primarycolor,
              icon: Icons.person_outline,
              onPressed: () => Get.toNamed(Approutes.login),
            ),
            SizedBox(height: 20.h),

            // زر المهندس
            CustomchooseLoginButton(
              title: 'login_as_engineering'.tr,
              color:Colors.orange.shade500,
              icon: Icons.engineering_outlined,
              onPressed: () => Get.toNamed(Approutes.login),
            ),
            SizedBox(height: 20.h),

            // زر الأدمن
            CustomchooseLoginButton(
              title: 'login_as_admin'.tr,
              color: Appcolor.primarycolor,
              icon: Icons.admin_panel_settings_outlined,
              onPressed: () => Get.toNamed(Approutes.login),
            ),
          ],
        ),
      ),
    );
  }
}
