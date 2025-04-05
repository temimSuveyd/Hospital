import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/Engineering Department/profileengineer_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/ProfileOptionWidget.dart';
import '../../shared/widgets/customdilogdelete.dart';
import '../../shared/widgets/customlogout.dart';

class Containerengineerprofile extends GetView<ProfileengineerControllerImp> {
  const Containerengineerprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
        builder: (controllerloc) =>
            Container(
              padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
              decoration: BoxDecoration(
                color: controllerloc.isDarkMode ? Colors.black : Colors.white
                    .withOpacity(0.2),
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
                      icon: Icons.edit, title: "Edit Profile".tr, onTap: () {
                    controller.gotoeditprofilepage();
                  }, iconColor: Colors.blue),
                  ProfileOptionWidget(
                    icon: Icons.delete,
                    title: "Delete Account".tr,
                    onTap: () {},
                    iconColor: Colors.red,
                    textColor: Colors.red,),

                ],
              ),
            ));
  }
}

// نافذة تأكيد حذف الحساب
void _showDeleteDialog(ProfileengineerControllerImp controller) {
  Get.dialog(DeleteAccountDialog(
    onConfirm: () {
      controller.deleteAccount();
    },
  ));
}

