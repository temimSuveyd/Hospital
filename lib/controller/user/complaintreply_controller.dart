import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hosptail/data/model/complaint_model.dart';

class ComplaintreplyController extends GetxController {
  ComplaintModel? complaint;

  gotocomplaintrepley(){

  }
  @override
  void onInit() {
    super.onInit();
    complaint = Get.arguments["complaint"] ;
  }


}

