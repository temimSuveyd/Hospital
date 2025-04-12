import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/ProfileOptionWidget.dart';
import '../../../controller/Contractor/contractorprofile_controller.dart';
import '../../admin/widgets/imageprofile.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../shared/widgets/customdilogdelete.dart';
import '../../shared/widgets/customemailprofile.dart';
import '../../shared/widgets/customtitleprofile.dart';
import '../widget/containerprofilecontractor.dart';

class ContractorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ContractorprofileControllerImp());

    return GetBuilder<Localcontroller>(
      builder: (local_controller) => 
      Scaffold(
        backgroundColor: local_controller.isDarkMode ? Appcolor.colorbackground : Appcolor.white ,
        appBar:  CustomAppBarApp(title: "Setting".tr),
        body: GetBuilder<ContractorprofileControllerImp>(
            builder: (controller) => Handlingdataview(
                widget: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // صورة الملف الشخصي مع تأثير الظل
                        Imageprofile(
                          path: "asset/images/avatar.png",
                        ),
                        SizedBox(height: 15.h),
      
                        // اسم المستخدم
                        Customtitleprofile(
                          text: controller.userName ?? "",
                        ),
      
                        SizedBox(height: 5.h),
      
                        // البريد الإلكتروني
                        Customemailprofile(
                          email: controller.userEmail ?? "",
                        ),
      
                        SizedBox(height: 30.h),
      
           ProfileOptionWidget(
                icon: Icons.edit,
                title: "Edit Profile".tr,
                onTap: () => controller.gotoeditprofile(),
                iconColor: Colors.blue,
              ),
      
              ProfileOptionWidget(
                icon: Icons.delete,
                title: "Delete Account".tr,
                onTap: () => controller.deleteAccount(), // ✅ استدعاء دالة الحذف
                iconColor: Colors.red,
                textColor: Colors.red,
              ),
                      ],
                    ),
                  ),
                ),
                statusreqest: controller.statusreqest)),
      ),
    );
  }
}
