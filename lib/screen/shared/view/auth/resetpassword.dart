import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../../controller/user/setting_user_controller.dart';
import '../../../../core/functions/inputvaild.dart';

import '../../widgets/auth/Customrowsighuporloginredirct.dart';
import '../../widgets/auth/curvePainterlogin.dart';
import '../../widgets/auth/custombottomauth.dart';
import '../../widgets/auth/customfieldauth.dart';
import '../../widgets/auth/customfieldpassword.dart';
import '../../widgets/auth/customforgrttext.dart';
import '../../widgets/auth/customtitleauth.dart';

class Resetpassword extends StatelessWidget {
  final ResetpasswordController controller = Get.put(ResetpasswordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
        builder: (local_controller) => Scaffold(
           
              backgroundColor: local_controller.isDarkMode
                  ? Appcolor.colorcarddark
                  : Appcolor.white,
     // backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Custom Curves
            Positioned.fill(
              child: CustomPaint(
                painter: CurvePainter(),
                size: Size(double.infinity, 800.h),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 170.h),
                    Customtitleauth(title: "Login".tr),
                    SizedBox(height: 50.h),

                    SizedBox(height: 10.h),
                    Obx(
                            () => Customfieldpassword (
                          onTapicon: () {
                            controller.togglePasswordVisibility();
                          },
                          obscureText: !controller.isPasswordVisible.value,
                          labeltext: "new password".tr, // ✅ ترجمة "كلمة المرور"
                          // ✅ ترجمة "أدخل كلمة المرور"
                          icon:  controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          controller: controller.newpasswordController,
                          vaild: (val) => inputValid("newpassword", 20, 8, val!),
                          isnumber: false,
                        )),
                    SizedBox(height: 10.h),
                    Obx(
                            () => Customfieldpassword (
                          onTapicon: () {
                            controller.togglePasswordVisibility2();
                          },
                          obscureText: !controller.isPasswordVisible2.value,
                          labeltext: "comfirm password".tr, // ✅ ترجمة "كلمة المرور"
                          // ✅ ترجمة "أدخل كلمة المرور"
                          icon:  controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          controller: controller.newpasswordController,
                          vaild: (val) => inputValid("password", 20, 8, val!),
                          isnumber: false,
                        )),


                     SizedBox(height: 60.h),
                    // Log In Button
                    Custombottomauth(text: "Continue".tr,onPressed: (){
                      Get.toNamed(Approutes.login);
                    },),
                     SizedBox(height: 20.h),
                    // Sign Up Redirect
                    Customrowsighuporloginredirct(textone: "Don't have an account".tr, texttwo:"Sign Up".tr,ontap: () {
                      Get.toNamed(Approutes.sighup);
                    },),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}

