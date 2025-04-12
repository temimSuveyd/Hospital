import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../controller/auth/otpverificationcontroller.dart';
import '../../../../controller/user/setting_user_controller.dart';
import '../../widgets/auth/curvePainterlogin.dart';
import '../../widgets/auth/custombottomauth.dart';
import '../../widgets/auth/customtitleauth.dart';
import '../../widgets/auth/rememberPasswordButton.dart';
import '../../widgets/auth/resendCodeText.dart';
import '../../widgets/auth/custombodyotp.dart';
import '../../widgets/auth/pinCodeTextField.dart';

class OTPVerificationPage extends StatelessWidget {
  final OTPVerificationControllerImp controller = Get.put(OTPVerificationControllerImp());
 // final SettingsController controllersett = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<Localcontroller>(
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
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 130.h),
                    Center(child: Customtitleauth(title: "Enter OTP".tr)),
                    SizedBox(height: 20.h),
                    Custombodyotp(title: "We've sent an OTP code to your email,\nUser53684@gmail.com".tr)
                   ,
                    SizedBox(height: 50.h),
                    CustomPinCodeTextField(
                      controller: controller.otpController,
                      onChanged: (value) {
                        print("OTP: $value");
                      },
                    ),

                    SizedBox(height: 20.h),
                    Obx(() => ResendCodeText(
                      isResending: controller.isResending.value,
                      resendTime: controller.resendTime.value,
                    ))
                    ,
                    SizedBox(height: 30.h),
                    Center(
                      child: Custombottomauth(
                        text: "Verify".tr,
                        onPressed: () {
                          controller.verifyOTP();
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    RememberPasswordButton(onPressed: (){
                      Get.toNamed(Approutes.login);
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
