import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';

import '../../screen/admin/view/departmentsadmin.dart';
import '../../screen/admin/view/homepage_admin.dart';
import '../../screen/admin/view/users.dart';
import '../../screen/shared/view/Lanugage.dart';
import '../../screen/user/view/add_complaint_suser.dart';
import '../../screen/user/view/complaints_View.dart';
import '../../screen/user/view/home_user.dart';
import '../../screen/user/view/setting.dart';

abstract class HomepageuserController extends GetxController {
  changepage(int i);
}

class HomepageuserControllerImp extends HomepageuserController {
  int currentpage = 0;
  // قائمة الأقسام الخاصة بالمشرف
  final List<Map<String, dynamic>> contractorSections = [
    {
      "title": 'Complaint'.tr,
      "icon": Icons.person,
      "route": Approutes.contractorComplaints
    },
    // {
    //   "title": 'Notification'.tr,
    //   "icon": Icons.notifications,
    //   "route": "/NotificationContractorPage"
    // },
    // {"title": 'Add Notification'.tr, "icon": Icons.add, "route": "/AddNotificationPage"},
  ];

  @override
  changepage(int i) {
    currentpage = i;
    update();
  }
}
