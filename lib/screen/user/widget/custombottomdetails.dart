import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class Custombottomdetails extends StatelessWidget {
 final void Function()? onPressed;
  const Custombottomdetails({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.primarycolor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        child: Text(
          "Details".tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );;
  }
}
