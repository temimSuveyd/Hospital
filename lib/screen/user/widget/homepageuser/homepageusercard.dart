import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/user/widget/custombottomdetails.dart';

import 'package:hosptail/screen/user/widget/homepageuser/customrowone.dart';
import 'package:hosptail/screen/user/widget/homepageuser/customtitlecard.dart';

import '../../../../controller/user/home_screen_user_controller.dart';
import '../../../../controller/user/setting_user_controller.dart';
import '../../../../core/constant/color.dart';



class PageCard extends GetView<HomescreencontrollerImp>{
  final String title;
 // final String category;
  //final String status;
  final VoidCallback onTap;

  const PageCard({
    super.key,
    required this.title,
   // required this.category,
   // required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
   // final SettingsController controller = Get.put(SettingsController());
    return  GetBuilder<Localcontroller>(
      builder: ( controller)=>
       Card(
        margin: EdgeInsets.only(bottom: 15.h),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(15.r),
           side: BorderSide(
             color: controller.isDarkMode ? Colors.blue : Appcolor.primarycolor, // ✅ لون الإطار
             width: 2, // ✅ سمك الإطار
           ),
         ),
        elevation: 6,
        color:controller.isDarkMode?Appcolor.colorbackground:Colors.white,
        shadowColor: Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customtitlecard(title: title,),

              SizedBox(height: 8.h),
             // Customrowone(
               // text: category, icon: Icons.category, color: Colors.blueGrey,),
              SizedBox(height: 5.h),
             // Customrowone(
               // text: status, icon: Icons.timer, color: Appcolor.primarycolor,),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Spacer(),
                  Custombottomdetails(onPressed: onTap,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


