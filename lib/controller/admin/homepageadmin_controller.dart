


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';





abstract class HomepageadminController extends GetxController{
  changepage(int i) ;

}
class HomepageadminControllerImp extends HomepageadminController{
  int currentpage=0;
  // قائمة الأقسام الخاصة بالمشرف
  final List<Map<String, dynamic>> adminSections = [
    {"title": 'Users'.tr, "icon": Icons.person, "route": Approutes.dminUsers},
    {"title": 'Departments'.tr, "icon": Icons.business, "route": Approutes.adminDepartments},
    {"title": 'Complaints'.tr, "icon": Icons.report_problem_rounded, "route": Approutes.adminAllComplaints},
    // {"title": 'Engineers'.tr, "icon": Icons.engineering, "route": Approutes.adminEngineers},


   // {"title": 'Contractors'.tr, "icon": Icons.engineering, "route": "/Contractors"},
  ];



  @override
  changepage(int i) {

    currentpage=i;
    update();
  }


}