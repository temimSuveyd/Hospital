

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../screen/shared/view/Lanugage.dart';
import '../../screen/user/view/add_complaint_suser.dart';
import '../../screen/user/view/complaints_View.dart';
import '../../screen/user/view/home_user.dart';
import '../../screen/user/view/setting.dart';





abstract class Homescreencontroller extends GetxController{
  changepage(int i) ;

}
class HomescreencontrollerImp extends Homescreencontroller{
  int currentpage=0;
  List<Widget> pages=[
    Homeuser(),
   // Addcomplaintsuser(),
   // Complaintsuser(),
    SettingsScreen(),





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