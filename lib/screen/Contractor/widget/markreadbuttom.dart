import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';

class MarkAsReadButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MarkAsReadButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.check_circle, color: Colors.white),
        label: Text(
          'mark_as_read'.tr,
          style:  TextStyle(color: Colors.white,fontFamily: "cairo",fontWeight: FontWeight.bold,fontSize: 14.sp),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.primarycolor,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 40.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
