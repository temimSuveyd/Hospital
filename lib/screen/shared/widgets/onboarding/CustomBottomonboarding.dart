import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/onboarding_controller.dart';
import '../../../../core/constant/color.dart';

class CustomBottomOnboarding extends GetView<OnboardingcontrollerImp> {
  const CustomBottomOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 40.h, left: 20.w, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر "تخطي"
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
                backgroundColor: Appcolor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: controller.skip,
              child: Text(
                "Skip".tr,
                style: TextStyle(
                  color: Appcolor.primarycolor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
                SizedBox(width: 5.w,),
          // زر "متابعة"
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                backgroundColor: Appcolor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: controller.next,
              child: Text(
                "Continue".tr,
                style: TextStyle(
                  color: Appcolor.thirdcolor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
