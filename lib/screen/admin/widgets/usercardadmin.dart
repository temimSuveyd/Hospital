import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/data/model/users_model.dart';

import '../../../controller/admin/usersadmin_controller.dart';
import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';

class UserCard extends GetView<UsersadminControllerImp> {
final UserModel userModel ;
  const UserCard({
    super.key,
    required this.userModel
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
        builder: ( controllerloc) =>Card(
          color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.h),
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(
              color:  Colors.blue, // ✅ لون الإطار
              width: 2, // ✅ سمك الإطار
            ),
          ),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(12.w),
        leading: CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.grey[300],
          backgroundImage: AssetImage("asset/images/avatar.png"),
        ),
        title: Text(
         userModel.userName!, // هنا يمكنك استخدام اسم المستخدم من البيانات الخاصة بك
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color:controllerloc. isDarkMode ? Appcolor.white : Appcolor.black,
          ),
        ),
        subtitle: Text(
          userModel.userEmail!,
          style: TextStyle(
            fontSize: 14.sp,
            color: Appcolor.thirdcolor,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "Complaints") {
              controller.goToUserComplaints(userModel.userUid!);
            } else if (value == "delete") {
controller.deleteUser(userModel.userUid!,userModel.userRole!);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: "Complaints", child: Text("الشكاوي",style: TextStyle(color: Colors.blue,fontFamily: "cairo",fontWeight: FontWeight.bold))),
            PopupMenuItem(value: "delete", child: Text("حذف الحساب", style: TextStyle(color: Colors.red,fontFamily: "cairo",fontWeight: FontWeight.bold))),
          ],
          icon: Icon(Icons.more_vert, color: Colors.blue, size: 30),
        ),
      ),
    ));
  }
}
