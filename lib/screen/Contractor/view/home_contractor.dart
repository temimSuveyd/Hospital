import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../controller/Contractor/homepagecontractor_controller.dart';
import '../../Engineering Department/widget/contractorpagecard.dart';
import '../widget/profileheader.dart';

class Homecontractor extends StatelessWidget {
  const Homecontractor({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageuserControllerImp controller = Get.put(HomepageuserControllerImp());

    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
        body: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            // ✅ ✅ ✅ إضافة الصورة مع اسم المقاول ✅ ✅ ✅
            ProfileHeader(
              path: "asset/images/avatar.png",
              text: "Hi, Contractor".tr,
            ),
            SizedBox(
              height: 15.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              itemCount: controller.contractorSections.length,
              itemBuilder: (context, index) => Contractorpagecard(
                title:
                    controller.contractorSections[index]["title"].toString().tr,
                onTap: () {
                  Get.toNamed(controller.contractorSections[index]
                      ["route"]); // التنقل إلى الصفحة المناسبة
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
