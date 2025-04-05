import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';

class Customtitlecard extends StatelessWidget {
  final String title;
  const Customtitlecard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: ( controller) =>
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          fontFamily: "Cairo",
          color:controller.isDarkMode? Appcolor.white:Appcolor.black
        ),
      ),
    );
  }
}
