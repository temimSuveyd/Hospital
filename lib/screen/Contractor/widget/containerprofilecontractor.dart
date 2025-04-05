import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';

import '../../../controller/Contractor/contractorprofile_controller.dart';
import '../../../controller/admin/adminprofilecontroller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/ProfileOptionWidget.dart';
import '../../shared/widgets/customlogout.dart';

class Containerprofilecontractor extends GetView<ContractorprofileControllerImp> {
  const Containerprofilecontractor({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<Localcontroller>(
        builder: ( controllerloc) => Container(
          padding: EdgeInsets.only(bottom: 20.h, top: 20.h,right: 10.w,left: 10.w),
          decoration: BoxDecoration(
            color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
            borderRadius: BorderRadius.circular(15.r),

           // border: Border.all(color: Appcolor.primarycolor),
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
                controller.gotoeditprofile();
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
