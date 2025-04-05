import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';

class Customtitleauth extends StatelessWidget {
  final String title;

  const Customtitleauth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return  GetBuilder<Localcontroller>(
      builder: ( controller)=>
       Center(
        child: Text(
          "${title}"
         ,
         textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color:controller.isDarkMode?Colors.white: Colors.black87,
            
            shadows: [
              Shadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
