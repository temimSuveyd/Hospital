import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import '../../../controller/Engineering Department/profileengineer_controller.dart';
import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';
import '../../admin/widgets/imageprofile.dart';
import '../../shared/widgets/ProfileOptionWidget.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../shared/widgets/customdilogdelete.dart';
import '../../shared/widgets/customemailprofile.dart';
import '../../shared/widgets/customlogout.dart';
import '../../shared/widgets/customtitleprofile.dart';
import '../widget/containerengineerprofile.dart';

class EngineerProfile extends StatelessWidget {
  const EngineerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileengineerControllerImp());
    return Scaffold(
      appBar: const CustomAppBarApp(title: ""),
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

                      // صندوق القائمة مع تأثير الزجاج
                      Containerengineerprofile(),
                    ],
                  ),
                ),
              ),
              statusreqest: controller.statusreqest)),
    );
  }
}
