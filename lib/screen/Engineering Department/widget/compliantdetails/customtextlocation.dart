import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';

class Customtextlocation extends StatelessWidget {
  final String text;

  const Customtextlocation({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: ( controller) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Text(
          text.isNotEmpty ? text : "No location available", // عرض رسالة افتراضية في حالة عدم وجود بيانات
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color:controller.isDarkMode?Colors.white: Colors.blue,
            fontFamily: "Cairo",
          ),
        ),
      ),
    );
  }
}
