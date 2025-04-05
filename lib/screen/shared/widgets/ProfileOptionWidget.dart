import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../core/constant/color.dart';

class ProfileOptionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color textColor;

  const ProfileOptionWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.r),
      splashColor: Colors.blue.withOpacity(0.2),
      child: GetBuilder<Localcontroller>(
        builder: ( controller) =>
         Card(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
           color:controller.isDarkMode?Appcolor.colorbackground:Colors.white,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.r),
             side: BorderSide(
               color: controller.isDarkMode ? Colors.blue : Appcolor.primarycolor, // ✅ لون الإطار
               width: 2, // ✅ سمك الإطار
             ),
           ),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 28.sp),
                SizedBox(width: 15.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color:controller.isDarkMode?Colors.white:  textColor,
                      fontFamily: "Cairo",
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 18.sp, color: textColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
