
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/constant/color.dart';
import '../../../../localization/changelocal.dart';

class Customfieldpassword extends StatelessWidget {
  final String labeltext;

  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? vaild;
  final bool isnumber;
  bool? obscureText;
  final Function()? onTapicon;

  Customfieldpassword({
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
      margin: EdgeInsets.only(bottom: 5.h),
      child: GetBuilder<Localcontroller>(
      builder: ( controllerloc) =>TextFormField(
        keyboardType: isnumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        controller: controller,
        validator: vaild,
        obscureText: obscureText ?? false, // استخدام القيمة الافتراضية إذا كانت null
        decoration: InputDecoration(
          filled: true,
          fillColor: controllerloc.isDarkMode?Colors.black12:Colors.white,
         // contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
         // floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            "$labeltext",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Appcolor.primarycolor),
          ),

          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Icon(Icons.lock, color:  Appcolor.secondcolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(color:controllerloc.isDarkMode? Appcolor.primarycolor:Colors.blue,width: 2.h),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(color:controllerloc.isDarkMode? Appcolor.primarycolor:Colors.blue,width: 2.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(color:controllerloc.isDarkMode? Appcolor.primarycolor:Colors.blue,width: 2.h),
          ),
          suffixIcon: icon != null
              ? InkWell(
            child: Icon(icon,color:  Appcolor.secondcolor),
            onTap: onTapicon,
          )
              : null, // عرض الأيقونة فقط إذا كانت موجودة

        ),
      ),
    ));
  }
}
