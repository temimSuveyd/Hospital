import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/screen/shared/widgets/customappbar.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';

import '../../../../core/functions/inputvaild.dart';

import '../../widgets/auth/Customrowsighuporloginredirct.dart';
import '../../widgets/auth/curvePainterlogin.dart';
import '../../widgets/auth/custombottomauth.dart';
import '../../widgets/auth/customfieldauth.dart';

import '../../widgets/auth/customtitleauth.dart';

class Forgetpasswordpage extends StatelessWidget {
  final ForgetpasswordControllerImp controller =
      Get.put(ForgetpasswordControllerImp());
  // final SettingsController controllersett = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: Customappbar(
        title: "Forget Password".tr,
      ),
      body: GetBuilder<ForgetpasswordControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // Custom Curves
                    // Positioned.fill(
                    //   child: CustomPaint(
                    //     painter: CurvePainter(),
                    //     size: Size(double.infinity, 800.h),
                    //   ),
                    // ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 170.h),
                            SizedBox(height: 50.h),

                            Customtitleauth(
                                title: "Enter yoru email to reset password"),
                            SizedBox(height: 50.h),
                            Customtextformauth(
                              icon: Icons.email,
                              labeltext:
                                  "email".tr, // ✅ ترجمة "البريد الإلكتروني"
                              // ✅ ترجمة "أدخل بريدك الإلكتروني"
                              // icon: Icons.email_outlined,
                              controller: controller.emailController,
                              vaild: (val) {
                                return inputValid("email", 30, 5, val!);
                              },
                              isnumber: false,
                            ),

                            const SizedBox(height: 60),
                            // Log In Button
                            Custombottomauth(
                              text: "Continue".tr,
                              onPressed: () {
                                controller.sendLink();
                              },
                            ),
                            const SizedBox(height: 20),
                            // Sign Up Redirect
                            Customrowsighuporloginredirct(
                              textone: " Don't have an account".tr,
                              texttwo: "Sign Up".tr,
                              ontap: () {
                                controller.goToSigin();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              statusreqest: controller.statusreqest)),
    );
  }
}
