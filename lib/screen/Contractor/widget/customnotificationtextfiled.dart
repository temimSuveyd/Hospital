import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../core/constant/color.dart';

class Customnotificationtextfiled extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final int maxLines;

  const Customnotificationtextfiled({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(builder: ( controllerloc) =>
       TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(fontFamily: 'Cairo'),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'Cairo',
            color: controllerloc.isDarkMode?Colors.white: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(icon, color: Appcolor.primarycolor),
          filled: true,
          fillColor: controllerloc.isDarkMode ? Appcolor.colorbackground: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Appcolor.primarycolor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Appcolor.primarycolor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Appcolor.primarycolor, width: 2),
          ),
        ),
      ),
    );
  }
}
