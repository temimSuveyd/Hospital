import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../core/constant/color.dart';

class Customtextformauth extends StatelessWidget {
  final String labeltext;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? vaild;
  final bool isnumber;
  final bool? obscureText; // جعلها final
  final Function()? onTapicon;

  const Customtextformauth({
    super.key,
    this.onTapicon,
    this.obscureText,
    required this.labeltext,
    this.icon,
    required this.controller,
    required this.vaild,
    required this.isnumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 5.h),
      child: GetBuilder<Localcontroller>(
        builder: ( controllerloc) =>
         TextFormField(
          keyboardType: isnumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          controller: controller,
          validator: vaild,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: controllerloc.isDarkMode?Colors.black12:Colors.white,
            labelText: labeltext, // بدون ${}
            labelStyle:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Appcolor.primarycolor,
            ),
            prefixIcon: icon != null
                ? InkWell(
              onTap: onTapicon,
              child: Icon(icon, color: Appcolor.secondcolor),
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide:  BorderSide(color:controllerloc.isDarkMode? Appcolor.primarycolor:Colors.blue,width: 2.h),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide:  BorderSide(color:controllerloc.isDarkMode? Appcolor.primarycolor:Colors.blue,width: 2.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide:  BorderSide(color:controllerloc.isDarkMode? Appcolor.primarycolor:Colors.blue, width: 2.h),
            ),
            hintStyle:  TextStyle(fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
