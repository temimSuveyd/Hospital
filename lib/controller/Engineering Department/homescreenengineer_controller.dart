

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../screen/Engineering Department/view/complaint_replyeng.dart';
import '../../screen/Engineering Department/view/add_reply_complaint_engineer.dart';
import '../../screen/Engineering Department/view/complainst_engineer.dart';
import '../../screen/Engineering Department/view/home_engineer.dart';
import '../../screen/Engineering Department/view/settingeng.dart';
import '../../screen/shared/view/Lanugage.dart';
import '../../screen/user/view/add_complaint_suser.dart';
import '../../screen/user/view/complaints_View.dart';
import '../../screen/user/view/home_user.dart';
import '../../screen/user/view/setting.dart';





abstract class HomescreenengineerController extends GetxController{
  changepage(int i) ;

}
class HomescreenengineerControllerImp extends HomescreenengineerController{
  int currentpage=0;
  List<Widget> pages=[
    Homeengineer(),
   // Complaintsengineer(),
    //Complaintreplyeng(),
    //Addreplycomplaintengineer(),
    SettingsScreenEng(),





  ];
  List namepage = [
    {"title": "Home".tr, "icon": Icons.home},
    //{"title": "Complaints".tr, "icon": Icons.list},
   // {"title": " replys", "icon": Icons.list},
    {"title": "Setting".tr, "icon": Icons.settings},
  ];

  @override
  changepage(int i) {

    currentpage=i;
    update();
  }


}