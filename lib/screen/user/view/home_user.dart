import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/user/home_screen_user_controller.dart';
import '../../../controller/user/homepageuser_controller.dart';
import '../../Contractor/widget/profileheader.dart';
import '../widget/customappbaruser.dart';
import '../widget/custombottomdetails.dart';
import '../widget/homepageuser/customrowone.dart';
import '../widget/homepageuser/customtitlecard.dart';
import '../widget/homepageuser/homepageusercard.dart';

class Homeuser extends StatelessWidget {
  const Homeuser({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageuserControllerImp controller = Get.put(HomepageuserControllerImp());
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(8.0.r),
        child: ListView(
          children: [
            //Customappbaruser(title: 'Hi, Doctor'.tr,),
            ProfileHeader(path: "asset/images/avatar.png", text: 'Hi, Doctor'.tr,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              itemCount: controller.userSections.length,
              itemBuilder: (context, index) => PageCard(
                title: controller.userSections[index]["title"].toString().tr,
                //category: "Maintenance".tr,
               // status: "Pending".tr,
                onTap: () {
                  Get.toNamed(controller.userSections[index]["route"]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
