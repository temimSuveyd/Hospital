import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombodyopenscreen extends StatelessWidget {
  final String title;

  const Custombodyopenscreen  ({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(10.0.r),
      child: Center(
          child: Text(
            textAlign: TextAlign.center,
            "${title}"
            ,
            style: TextStyle(

                color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.bold,fontFamily: "cairo",),
          )
      ),
    )
    ;
  }
}
