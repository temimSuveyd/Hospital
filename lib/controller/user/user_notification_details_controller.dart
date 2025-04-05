import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/data/model/complaint_model.dart';
abstract class UserNotificationDetailsController extends GetxController {
  initData();
}

class UserNotificationDetailsControllerImp
    extends UserNotificationDetailsController {
  ComplaintModel? complaintModel;
  Statusreqest statusreqest = Statusreqest.success;

  @override
  initData() {
    complaintModel = Get.arguments["complaintModel"];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
