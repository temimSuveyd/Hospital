

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../screen/admin/view/departmentsadmin.dart';
import '../../screen/admin/view/homepage_admin.dart';
import '../../screen/admin/view/users.dart';
import '../../screen/shared/view/Lanugage.dart';
import '../../screen/user/view/add_complaint_suser.dart';
import '../../screen/user/view/complaints_View.dart';
import '../../screen/user/view/home_user.dart';
import '../../screen/user/view/setting.dart';





abstract class HomepageengineerController extends GetxController{
  changepage(int i) ;

}
class HomepageengineerControllerImp extends HomepageengineerController{
  int currentpage=0;
  // قائمة الأقسام الخاصة بالمشرف
  final List<Map<String, dynamic>> engineerSections = [
    {"title": 'Complaints'.tr, "icon": Icons.person, "route": "/Complaintsengineer"},
    {"title": 'Notification'.tr, "icon": Icons.notifications, "route": "/Notificationengineer"},

  ];



  @override
  changepage(int i) {

    currentpage=i;
    update();
  }


}