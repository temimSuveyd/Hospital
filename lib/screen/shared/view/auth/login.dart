import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/Approutes.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../../../core/functions/inputvaild.dart';

import '../../widgets/auth/Customrowsighuporloginredirct.dart';
import '../../widgets/auth/curvePainterlogin.dart';
import '../../widgets/auth/custombottomauth.dart';
import '../../widgets/auth/customfieldauth.dart';
import '../../widgets/auth/customfieldpassword.dart';
import '../../widgets/auth/customforgrttext.dart';
import '../../widgets/auth/customtitleauth.dart';
import '../../widgets/auth/remmebercheckbox.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());

    return Scaffold(
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => Handlingdataview(
            widget: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  // الخلفية المنحنية
                  Positioned.fill(
                    child: CustomPaint(
                      painter: CurvePainter(),
                      size: Size(double.infinity, 800.h),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 170.h),
                          Customtitleauth(title: "Login".tr),
                          SizedBox(height: 50.h),

                          // حقل البريد الإلكتروني
                          Customtextformauth(
                            icon: Icons.email,
                            labeltext: "email".tr,
                            controller: controller.employeeemailController,
                            vaild: (val) {
                              return inputValid("email", 30, 5, val!);
                            },
                            isnumber: false,
                          ),
                          SizedBox(height: 5.h),

                          // حقل كلمة المرور
                          Obx(() => Customfieldpassword(
                                onTapicon: () {
                                  controller.togglePasswordVisibility();
                                },
                                obscureText:
                                    !controller.isPasswordVisible.value,
                                labeltext: "password".tr,
                                icon: controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                controller: controller.passwordController,
                                vaild: (val) =>
                                    inputValid("password", 20, 8, val!),
                                isnumber: false,
                              )),

                          // نص "نسيت كلمة المرور"

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Customforgrttext(
                                text: "forget password".tr,
                                ontap: () {
                                  controller.gotoforgetpassword();
                                },
                              ),
                              SizedBox(width: 40.h),
                              Obx(() => Flexible(
                                    child: RememberMeCheckbox(
                                      value: controller.rememberMe.value,
                                      onChanged: controller.toggleRememberMe,
                                    ),
                                  )),
                            ],
                          ),

                          SizedBox(height: 10.h),

                          // مربع "تذكرني"

                          SizedBox(height: 30.h),

                          // زر تسجيل الدخول
                          Custombottomauth(
                            text: "Log In".tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),

                          SizedBox(height: 20.h),

                          // الانتقال إلى صفحة التسجيل
                          Customrowsighuporloginredirct(
                            textone: "Don't have an account".tr,
                            texttwo: "Sign Up".tr,
                            ontap: () {
                              Get.toNamed(Approutes.sighup);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            statusreqest: controller.statusreqest),
      ),
    );
  }
}
