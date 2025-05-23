import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';

import '../../../controller/user/user_profile_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/ProfileOptionWidget.dart';


class Containeruserprofile extends GetView<UserprofileControllerImp> {
  const Containeruserprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controllerloc) => Container(
        padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
        decoration: BoxDecoration(
          color: controllerloc.isDarkMode ? Appcolor.colorbackground : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(color: Colors.blue.shade50, blurRadius: 6.r, spreadRadius: 2.r),
          ],
        ),
        child: Column(
          children: [
            /// **تعديل الملف الشخصي**
            ProfileOptionWidget(
              icon: Icons.edit,
              title: "Edit Profile".tr,
              onTap: controller.gotoeditprofile, // ✅ تمرير `onTap` بشكل صحيح
              iconColor: Colors.blue,
            ),

            /// **حذف الحساب مع نافذة التأكيد**
            ProfileOptionWidget(
              icon: Icons.delete,
              title: "Delete Account".tr,
              onTap: () => controller.deleteAccount() , // ✅ استدعاء دالة الحذف
              iconColor: Colors.red,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
  }


  /// **نافذة تأكيد حذف الحساب**
