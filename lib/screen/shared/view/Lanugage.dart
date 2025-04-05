import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/Approutes.dart';
import '../../../localization/changelocal.dart';

import '../widgets/custombottomlang.dart';

class Lanugage extends GetView<Localcontroller> {
  const Lanugage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade400,
              Colors.blue.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "choose_language".tr,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
                fontFamily: "Cairo",
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),

            // زر اللغة العربية
            Custombottomlang(
              textbottom: 'ar'.tr,
              icon: Icons.language,
              color: Colors.blue.shade500,
              onPressed: () {
               // controller.changelocal("ar");
                Get.toNamed(Approutes.onboarding);
              },
            ),
            SizedBox(height: 20.h),

            // زر اللغة الإنجليزية
            Custombottomlang(
              textbottom: 'en'.tr,
              icon: Icons.language,
              color: Colors.orange.shade500,
              onPressed: () {
               // controller.changelocal("en");
                Get.toNamed(Approutes.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
