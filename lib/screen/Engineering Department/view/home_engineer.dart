import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/Engineering%20Department/widget/pagecard.dart';

import '../../../controller/Engineering Department/homepageengineer_controller.dart';
import '../../Contractor/widget/profileheader.dart';

class Homeengineer extends StatelessWidget {
  const Homeengineer({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageengineerControllerImp controller =
        Get.put(HomepageengineerControllerImp());
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
        body: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: ListView(
            children: [
              ProfileHeader(
                path: "asset/images/avatar.png",
                text: 'Hi enginner'.tr,
              ),
              // Customappbaruser(title: 'Hi enginner'.tr,),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                itemCount: controller.engineerSections.length,
                itemBuilder: (context, index) => PageCardengineer(
                  title:
                      controller.engineerSections[index]["title"].toString().tr,
                  onTap: () {
                    Get.toNamed(controller.engineerSections[index]["route"]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
