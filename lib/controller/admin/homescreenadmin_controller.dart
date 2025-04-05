

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../screen/admin/view/departmentsadmin.dart';
import '../../screen/admin/view/homepage_admin.dart';
import '../../screen/admin/view/settings_admin.dart';
import '../../screen/admin/view/users.dart';
import '../../screen/shared/view/Lanugage.dart';
import '../../screen/user/view/add_complaint_suser.dart';
import '../../screen/user/view/complaints_View.dart';
import '../../screen/user/view/home_user.dart';
import '../../screen/user/view/setting.dart';





abstract class HomescreenadminController extends GetxController{
  changepage(int i) ;

}
class HomescreenadminControllerImp extends HomescreenadminController{
  int currentpage=0;
  List<Widget> pages=[
    AdminhomePage(),


    Settingadmin(),





  ];
  List namepage = [
    {"title": "Home".tr, "icon": Icons.home},

    {"title": "Setting".tr, "icon": Icons.settings},
  ];

  @override
  changepage(int i) {

    currentpage=i;
    update();
  }


}