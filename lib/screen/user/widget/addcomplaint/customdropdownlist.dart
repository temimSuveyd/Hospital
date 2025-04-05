import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../controller/user/setting_user_controller.dart';
import '../../../../core/constant/color.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final RxString selectedItem;
  final String hint;
  final IconData icon;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
   // final SettingsController controllersett = Get.put(SettingsController());
    return  GetBuilder<Localcontroller>(
        builder: (controller)  =>
        DropdownButtonFormField<String>(
          isExpanded: true, // ✅ إضافة لتجنب الـ Overflow
          value: selectedItem.value.isEmpty ? null : selectedItem.value,
          items: items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Cairo",
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // ✅ لتفادي النص الطويل
            ),
          ))
              .toList(),
          onChanged: (value) => selectedItem.value = value!,
          icon: Icon(Icons.arrow_drop_down_circle, color: Appcolor.primarycolor),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold),
            filled: true,
            fillColor:controller.isDarkMode?Appcolor.colorbackground: Colors.white,
            prefixIcon: Icon(icon, color: Appcolor.primarycolor, size: 22.sp),
            contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w), // ✅ تقليل الهوامش
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.blue,width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.blue,width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Appcolor.primarycolor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: (value) => value == null ? "Please select an option" : null,
        ),
    );}}
