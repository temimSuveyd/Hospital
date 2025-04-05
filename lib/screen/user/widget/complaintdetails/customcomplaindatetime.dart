import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customcomplaindatetime extends StatelessWidget {
  final String text;
  final IconData? icon;
  const Customcomplaindatetime({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(icon, color: Colors.grey, size: 16.sp),
        SizedBox(width: 5.w),
        Text(
          text ?? "",
          style: TextStyle(fontSize: 14.sp, color: Colors.blue, fontFamily: "cairo",fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
