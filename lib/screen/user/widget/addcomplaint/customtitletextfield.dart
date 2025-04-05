import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../controller/user/setting_user_controller.dart';
import '../../../../core/constant/color.dart';

class Customtitletextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final int maxLines;

  const Customtitletextfield({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
  //  final SettingsController controllersett = Get.put(SettingsController());
    return  GetBuilder<Localcontroller>(
        builder: ( controllerloc) =>
       TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(fontSize: 14.sp, fontFamily: "Cairo"),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
            prefixIcon: Icon(icon, color: Appcolor.primarycolor, size: 22.sp),
            filled: true,
            fillColor:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.blue,width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color:  Colors.blue,width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Appcolor.primarycolor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "This field cannot be empty";
            }
            return null;
          },
        ),

    );
  }
}
