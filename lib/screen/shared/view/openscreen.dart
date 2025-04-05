import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/openscreen_controller.dart';
import '../widgets/custombodyopenscreen.dart';
import '../widgets/custombuttomopenscreen.dart';
import '../widgets/customtitleopenscreen.dart';


class OpenScreen extends StatelessWidget {
  final OpenscreenController controller = Get.put(OpenscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(Icons.change_history, size: 100, color: Colors.white),
              SizedBox(height: 20.sp),
              Customtitleopenscreen(title:  "Complaint Tracker".tr),
              SizedBox(height: 10.h),
              Custombodyopenscreen(title:"Please enter your email and password to log in.".tr,),
              SizedBox(height: 30),
              Spacer(),
              Column(
                children: [
                  Custombuttomopenscreen(onPressed:   controller.login, textbottom: "Log In".tr,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
