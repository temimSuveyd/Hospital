import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class Customrowone extends StatelessWidget {
final  IconData? icon;
final String text;
final Color? color;
  const Customrowone({super.key, this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Appcolor.thirdcolor, size: 16.sp),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            color:  color,
            fontSize: 14.sp,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );;
  }
}
