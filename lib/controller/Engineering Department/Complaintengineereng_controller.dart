import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ComplaintengineerengController extends GetxController {
  goToDetails(ComplaintModel complaintModel);
  getComplaints();
  getSharedData();
}

class ComplaintengineerengControllerImp extends ComplaintengineerengController {
  var complaintsList = [].obs;
  ComplaintData _complaintData = ComplaintData();
  Statusreqest statusreqest = Statusreqest.success;
  String? department;

  @override
  goToDetails(ComplaintModel complaintModel) {
    Get.toNamed(Approutes.engineerComplaintDetails,
        arguments: {"complaintModel": complaintModel});
  }

  @override
  getComplaints() async {
    statusreqest = Statusreqest.loading;
    update();
    await getSharedData();
    try {
      _complaintData.getEngineerComplaints(department!).listen(
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
  getSharedData() async {
    final prefs = await SharedPreferences.getInstance();
    department = prefs.getString(Appshareds.department) ?? "";
  }

  @override
  void onInit() {
    getComplaints();
    super.onInit();
  }
}
