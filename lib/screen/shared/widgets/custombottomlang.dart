import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/constant/color.dart';

class Custombottomlang extends StatelessWidget {
  final String textbottom;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const Custombottomlang({
    super.key,
    required this.textbottom,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: ElevatedButton.icon(
        icon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, ),
          child: Icon(icon, color: Colors.white, size: 24.sp),
        ),
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, ),
          child: Text(
            textbottom,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
              color: Appcolor.white
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 8,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
