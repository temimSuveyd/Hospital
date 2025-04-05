import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';

class CustomDropdownDepartment extends StatelessWidget {
  final String labeltext;
  final List<String> items;
  final Function(String?) onChanged;
  final String? selectedValue;

  const CustomDropdownDepartment({
    Key? key,
    required this.labeltext,
    required this.items,
    required this.onChanged,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controllerloc) => DropdownButtonFormField<String>(
        isExpanded: true, // ✅ يمنع تجاوز العرض
        decoration: InputDecoration(
          filled: true,
          fillColor: controllerloc.isDarkMode ? Colors.black12 : Colors.white,
          labelText: labeltext.tr,
          labelStyle: TextStyle(
            color: Appcolor.primarycolor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: controllerloc.isDarkMode
                  ? Appcolor.primarycolor
                  : Colors.blue,
              width: 2.h,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: controllerloc.isDarkMode
                  ? Appcolor.primarycolor
                  : Colors.blue,
              width: 2.h,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: controllerloc.isDarkMode
                  ? Appcolor.primarycolor
                  : Colors.blue,
              width: 2.h,
            ),
          ),
          prefixIcon: Icon(Icons.business, color: Appcolor.secondcolor),
        ),
        value: selectedValue,
        items: items
            .map((dept) => DropdownMenuItem(
          value: dept,
          child: FittedBox(
            fit: BoxFit.scaleDown, // ✅ يتأكد من ضبط النص داخل المساحة
            alignment: Alignment.centerLeft,
            child: Text(
              dept.tr,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis, // ✅ إذا كان النص طويلًا
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
