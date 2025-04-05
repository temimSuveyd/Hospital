import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hosptail/core/constant/Approutes.dart';

import '../../../controller/admin/adminprofilecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/ProfileOptionWidget.dart';
import '../../shared/widgets/customlogout.dart';

class Containerprofile extends GetView<AdminprofilecontrollerImp> {
  const Containerprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<Localcontroller>(
        builder: ( controllerloc) => Container(
      padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
      decoration: BoxDecoration(
        color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.blue.shade50,
              blurRadius: 6.r,
              spreadRadius: 2.r),
        ],
      ),
      child: Column(
        children: [
          ProfileOptionWidget(
              icon: Icons.edit, title: "Edit Profile".tr,  onTap: () {
            controller.gotoeditprofilepage();
          }, iconColor: Colors.blue),
          ProfileOptionWidget(icon: Icons.delete,
            title: "Delete Account".tr,
            onTap: () {},
            iconColor: Colors.red,
            textColor: Colors.red,),

        ],
      ),
    ));
  }
}
