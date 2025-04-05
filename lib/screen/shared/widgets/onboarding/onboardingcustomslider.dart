import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../controller/onboarding_controller.dart';
import '../../../../data/dataScore/static/onboarding.dart';

class OnboardingCustomSlider extends GetView<OnboardingcontrollerImp> {
  const OnboardingCustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (val) {
        controller.onpagechanged(val);
      },
      itemCount: onboardinglist.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // صورة مع تأثير الظل
              Container(
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(
                  color: Appcolor.white,
                  boxShadow: [
                    BoxShadow(
                      color: Appcolor.primarycolor.withOpacity(0.2),
                      blurRadius: 30.r,
                      spreadRadius: 5.r,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Image.asset(
                  onboardinglist[i].image!,
                  width: 180.w,
                  height: 160.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40.h),

              // العنوان مع تدرج لوني
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Appcolor.white, Appcolor.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  onboardinglist[i].title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // النص الوصفي
              AnimatedOpacity(
                opacity: 0.9,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  onboardinglist[i].body!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Appcolor.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h),


            ],
          ),
        );
      },
    );
  }
}
