import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/user/homepageuser_controller.dart';
import '../../Contractor/widget/profileheader.dart';
import '../widget/homepageuser/homepageusercard.dart';

class Homeuser extends StatelessWidget {
  const Homeuser({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageuserControllerImp home_controller =
        Get.put(HomepageuserControllerImp());
    return GetBuilder<Localcontroller>(
      builder: (controller) => Scaffold(
        backgroundColor:
            controller.isDarkMode ? Appcolor.colorcarddark : Appcolor.white,
        body: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: ListView(
            children: [
              ProfileHeader(
                path: "asset/images/avatar.png",
                text: 'Hi, Doctor'.tr,
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: home_controller.userSections.length,
                itemBuilder: (context, index) => PageCard(
                  title: home_controller.userSections[index]["title"]
                      .toString()
                      .tr,
                  //category: "Maintenance".tr,
                  // status: "Pending".tr,
                  onTap: () {
                    Get.toNamed(home_controller.userSections[index]["route"]);
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
