import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import '../../../controller/user/user_profile_controller.dart';
import '../../admin/widgets/imageprofile.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../shared/widgets/customemailprofile.dart';
import '../../shared/widgets/customtitleprofile.dart';
import '../widget/containeruserprofile.dart';

class Userprofile extends StatelessWidget {
  const Userprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserprofileControllerImp());
    return Scaffold(
      appBar: const CustomAppBarApp(title: ""),
      body: GetBuilder<UserprofileControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: Padding(
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
                      text: controller.userName??"",
                    ),
      
                    SizedBox(height: 5.h),
      
                    // البريد الإلكتروني
                    Customemailprofile(
                      email: controller.userEmail??"",
                    ),
      
                    SizedBox(height: 30.h),
      
                    // صندوق القائمة مع تأثير الزجاج
                    Containeruserprofile()
                  ],
                ),
              ),
              statusreqest: controller.statusreqest)),
    );
  }
}
