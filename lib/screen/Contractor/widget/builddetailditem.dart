import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../core/constant/color.dart';

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Appcolor.primarycolor, size: 32.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Appcolor.primarycolor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
              ),
              SizedBox(height: 4.h),
              GetBuilder<Localcontroller>(
                builder: ( controller) =>
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: controller.isDarkMode?Appcolor.white:Appcolor.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
