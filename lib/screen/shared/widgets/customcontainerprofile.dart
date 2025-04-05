import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/Contractor/contractorprofile_controller.dart';
import '../../../core/constant/color.dart';

class Customcontainerprofile extends GetView<ContractorprofileControllerImp> {
  const Customcontainerprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h,top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.blue.shade50, blurRadius: 6.r, spreadRadius: 2.r),
        ],
      ),
      child: Column(
        children: [
          _buildProfileOption(
            icon: Icons.edit,
            title: "Edit Profile".tr,
            iconColor: Colors.blue,
            onTap: () => Get.toNamed("/editProfile"),
          ),
          _buildProfileOption(
            icon: Icons.delete,
            title: "Delete Account".tr,
            iconColor: Colors.red,
            textColor: Colors.red,
            onTap: () => _showDeleteDialog(controller),
          ),
          _buildProfileOption(
            icon: Icons.exit_to_app,
            title: "Logout".tr,
            iconColor: Colors.blue,
            textColor: Colors.blueGrey,
            onTap: () => _showLogoutDialog(controller),
          ),
        ],
      ),
    );
  }
}
// ويدجت لإنشاء كل خيار في القائمة مع تحسينات
Widget _buildProfileOption({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color iconColor = Colors.blue,
  Color textColor = Colors.black,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(15.r),
    splashColor: Colors.blue.withOpacity(0.2),
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      color: Appcolor.white,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 28.sp),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: textColor,fontFamily: "cairo")),
            ),
            Icon(Icons.arrow_forward_ios, size: 18.sp, color: textColor),
          ],
        ),
      ),
    ),
  );
}
// نافذة تأكيد حذف الحساب
void _showDeleteDialog(ContractorprofileControllerImp controller) {
  Get.defaultDialog(
    title: "Delete Account".tr,
    content: Text("Are you sure you want to delete your account?".tr),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () {
        controller.deleteAccount();
        Get.back();
      },
      child: Text("Yes, Delete".tr, style: TextStyle(color: Colors.white)),
    ),
    cancel: TextButton(
      onPressed: () => Get.back(),
      child: Text("Cancel".tr),
    ),
  );
}

// نافذة تأكيد تسجيل الخروج
void _showLogoutDialog(ContractorprofileControllerImp controller) {
  Get.defaultDialog(
    title: "Logout".tr,
    content: Text("Are you sure you want to logout?".tr),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
      onPressed: () {
        Get.offAllNamed("/login");
      },
      child: Text("Logout".tr, style: TextStyle(color: Colors.white)),
    ),
    cancel: TextButton(
      onPressed: () => Get.back(),
      child: Text("Cancel".tr),
    ),
  );

}
