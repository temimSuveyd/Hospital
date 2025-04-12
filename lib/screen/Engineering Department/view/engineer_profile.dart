import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../controller/Engineering Department/profileengineer_controller.dart';
import '../../admin/widgets/imageprofile.dart';
import '../../shared/widgets/ProfileOptionWidget.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../shared/widgets/customemailprofile.dart';
import '../../shared/widgets/customtitleprofile.dart';

class EngineerProfile extends StatelessWidget {
  const EngineerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileengineerControllerImp());
    return  GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
      appBar:  CustomAppBarApp(title: "Profile".tr),
      body: GetBuilder<ProfileengineerControllerImp>(
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
              onTap: () => controller.gotoeditprofilepage(),
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
              statusreqest: controller.statusreqest)),),
    );
  }
}
