import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../../localization/changelocal.dart';

class Customreplytext extends StatelessWidget {
  final String textone;
  final String texttwo;

  const Customreplytext({super.key, required this.textone, required this.texttwo});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textone,
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Appcolor.thirdcolor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "${'Reply'.tr} : $texttwo",
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 14.sp,
              color: controller.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
