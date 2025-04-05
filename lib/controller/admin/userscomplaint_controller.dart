import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';
import 'package:hosptail/data/model/complaint_model.dart';

abstract class UserscomplaintController extends GetxController {
  initData();
  getComplaints();
  goToDetails(ComplaintModel complaintModel);
}

class UserscomplaintControllerImp extends UserscomplaintController {
  var complaintsList = [].obs;
  ComplaintData _complaintData = ComplaintData();
  Statusreqest statusreqest = Statusreqest.success;

  String? userUid;

  @override
  initData() {
    userUid = Get.arguments["user_id"];
  }

  @override
  getComplaints() {
    statusreqest = Statusreqest.loading;
    update();
    try {
      _complaintData.getUserComplents(userUid!).listen(
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
      Get.defaultDialog();
    }
  }

  @override
  void onInit() {
    initData();
    getComplaints();
    super.onInit();
  }

  @override
  goToDetails(ComplaintModel complaintModel) {
    Get.toNamed(Approutes.adminComplaintDetails, arguments: {
      "complaintModel": complaintModel,
    });
  }
}
