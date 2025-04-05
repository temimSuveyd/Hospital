import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtitleopenscreen extends StatelessWidget {
  final String title;

  const Customtitleopenscreen ({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        "${title}"
        ,
        style: TextStyle(
            color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold,fontFamily: "cairo"),
      )
      )
    ;
  }
}
