import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class Custombottomadd extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Custombottomadd({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed:onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.primarycolor,
          padding: EdgeInsets.symmetric(
              horizontal: 100.w, vertical: 14.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)),
        ),
        child: Text(text, style: TextStyle(fontSize: 17.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,fontFamily: "cairo")),
      ),
    );
  }
}
