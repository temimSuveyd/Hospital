import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/constant/color.dart';

import '../../../localization/changelocal.dart';



class DepartmentCard extends StatelessWidget {
  final String icon;
  final String name;

  final VoidCallback onTap;

  const DepartmentCard({
    Key? key,
    required this.icon,
    required this.name,

    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
        builder: ( controllerloc) =>Card(
          margin: EdgeInsets.only(bottom: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),

            side: BorderSide(
              color: controllerloc.isDarkMode ? Colors.blue : Appcolor.primarycolor, // ✅ لون الإطار
              width: 2, // ✅ سمك الإطار
            ),
          ),
          elevation: 6,
          shadowColor: Colors.blue.shade300,
          color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,

      child: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: ListTile(
          leading: Text(icon, style: const TextStyle(fontSize: 30)),
          title: Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
          onTap: onTap,
        ),
      ),
    ));
  }
}
