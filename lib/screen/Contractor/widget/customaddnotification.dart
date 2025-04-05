import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomAddButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolor.primarycolor,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 120.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            'Add'.tr,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}
