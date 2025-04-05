import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';

class ProfileHeader extends StatelessWidget {
  final String path;
  final String text;
  const ProfileHeader({super.key, required this.path, required this.text});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<Localcontroller>(
        builder: ( controller) =>Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage(path),
          ),
          SizedBox(width: 10.w),
          Text(
            text,
              style: TextStyle(
                  color:controller.isDarkMode?Appcolor.white:Appcolor.black, fontSize: 20.sp, fontWeight: FontWeight.bold)),

        ],
      ),
    ));
  }
}
