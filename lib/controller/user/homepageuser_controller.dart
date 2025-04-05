

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





abstract class HomepageuserController extends GetxController{
  changepage(int i) ;

}
class HomepageuserControllerImp extends HomepageuserController{
  int currentpage=0;
  // قائمة الأقسام الخاصة بالمشرف
  final List<Map<String, dynamic>> userSections = [
    {"title": 'Add Complaints'.tr, "icon": Icons.person, "route": "/Addcomplaintsuser"},
    {"title": 'Complaints'.tr, "icon": Icons.business, "route": "/Complaintsuser"},
    {"title": 'Notification'.tr, "icon": Icons.notifications, "route": "/UserNotificationPage"},
    //{"title": 'Complaints'.tr, "icon": Icons.business, "route": "/Complaintsuser"},

  ];



  @override
  changepage(int i) {

    currentpage=i;
    update();
  }


}