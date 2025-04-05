import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';



class Custombottomlogout extends StatelessWidget {
  final void Function()? onPressed;
  const Custombottomlogout({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(

          backgroundColor: Appcolor.primarycolor,
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 14.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        child:  Text("LogOut".tr,
            style: TextStyle(fontSize: 16.sp, color: Colors.white,fontFamily: "cairo",fontWeight: FontWeight.bold)),
      ),
    );
  }
}
