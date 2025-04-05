import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';
import 'package:hosptail/data/model/complaint_model.dart';

abstract class DepartmentcomplaintController extends GetxController {
  initData();
  gotoComplaintDetails(ComplaintModel complaintModel);
  getComplaints();
}

class DepartmentcomplaintControllerImp extends DepartmentcomplaintController {
  var complaintsList = [].obs;
  Statusreqest statusreqest = Statusreqest.success;
  ComplaintData _complaintData = ComplaintData();
  String? id;
  String? userType;

  @override
  gotoComplaintDetails(ComplaintModel complaintModel) {
    Get.toNamed(Approutes.adminComplaintDetails,
        arguments: {"complaintModel": complaintModel});
  }

  @override
  initData() {
    id = Get.arguments["id"];
    userType = Get.arguments["userType"];
  }

  @override
  getComplaints() {
    statusreqest = Statusreqest.loading;
    update();
    try {
      _complaintData.getDepartmentComplaints(id!, userType!).listen(
        (event) {
          complaintsList.value = event.docs;
          if (complaintsList.isEmpty) {
            statusreqest = Statusreqest.noData;
            update();
          } else {
            statusreqest = Statusreqest.success;
            update();
          }
        },
      );
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  void onInit() {
    initData();
    getComplaints();
    super.onInit();
  }
}
