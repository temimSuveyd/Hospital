

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/screen/Contractor/view/complaints_contractor.dart';
import 'package:hosptail/screen/Contractor/view/home_contractor.dart';

import '../../screen/Contractor/view/departments.dart';
import '../../screen/Contractor/view/setting_contractor.dart';






abstract class HomescreencontractorController extends GetxController{
  changepage(int i) ;

}
class HomescreencontractorControllerImp extends HomescreencontractorController{
  int currentpage=0;
  List<Widget> pages=[
    Homecontractor(),
   // DepartmentsPage(),
   // Complaintscontractor(),
    Settingcontractor(),





  ];
  List namepage = [
    {"title": "Home".tr, "icon": Icons.home},
   // {"title": "department".tr, "icon": Icons.list},
   // {"title": "Complaints".tr, "icon": Icons.list},
    {"title": "Setting".tr, "icon": Icons.settings},
  ];

  @override
  changepage(int i) {

    currentpage=i;
    update();
  }


}