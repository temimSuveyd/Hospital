import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/controller/admin/departments_admin_controller.dart';
import 'package:hosptail/core/constant/color.dart';

import '../../../core/constant/Approutes.dart';
import '../../../localization/changelocal.dart';

class Departmentadmincard extends GetView<DepartmentsadminControllerImp> {
  final String icon;
  final String name;
  final String departmen;

  const Departmentadmincard({
    Key? key,
    required this.icon,
    required this.name,
    required this.departmen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
        builder: (controllerloc) => Card(
              margin: EdgeInsets.only(bottom: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
                side: BorderSide(
                  color: Colors.blue, // ✅ لون الإطار
                  width: 2, // ✅ سمك الإطار
                ),
              ),
              color: controllerloc.isDarkMode
                  ? Appcolor.colorbackground
                  : Colors.white,
              shadowColor: Colors.grey.shade300,
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.all(15.0.r),
                child: ListTile(
                  leading: Text(icon, style: TextStyle(fontSize: 20.sp)),
                  title: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo",
                      color: controllerloc.isDarkMode
                          ? Appcolor.white
                          : Appcolor.black,
                    ),
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == "engineers") {
                        controller.goToEngineers(departmen);
                      } else if (value == "contractors") {
                        controller.goToContactor(departmen);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          value: "engineers",
                          child: Text("engineers".tr,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold))),
                      PopupMenuItem(
                          value: "contractors",
                          child: Text("contractors".tr,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold))),
                    ],
                    icon: Icon(Icons.more_vert, color: Colors.blue, size: 30),
                  ),
                ),
              ),
            ));
  }
}
