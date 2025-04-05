import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';

class Customtextreply extends StatelessWidget {
  final String text;
  const Customtextreply({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: ( controller) =>
      Padding(
        padding:  EdgeInsets.all(10.0.r),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color:controller.isDarkMode?Colors.white: Colors.black,
              fontSize: 15.sp,
              fontFamily: "Cairo"),
        ),
      ),
    );
  }
}
