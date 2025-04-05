import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/data/model/complaint_model.dart';

class DepartmentcontactorController extends GetxController {
  final List<Map<String, String>> departments = [
    {"name": "Electrical Engineering".tr, "icon": "⚡"},
    //{"name": "Mechanical Engineering".tr, "icon": "🔧"},
   // {"name": "Electronic Engineering (Low Voltage)".tr, "icon": "💡"},
   // {"name": "Civil Engineering".tr, "icon": "🏗️"},
  ];


  gotoengineercontractor(){
    Get.toNamed(Approutes.contractorEngineers);

  }

  @override
  void onInit() {
    super.onInit();

  }


}

