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

abstract class ComplaintController extends GetxController {
  gotocomplaintrepley();
  getComplaints();
  getSharedData();
  goToDetails(ComplaintModel complaintModel);
}

class ComplaintControllerImp extends ComplaintController {
  var complaintsList = [].obs;
  ComplaintData _complaintData = ComplaintData();
  Statusreqest statusreqest = Statusreqest.success;

  String? userUid;

  @override
  gotocomplaintrepley() {
    Get.toNamed(Approutes.userComplaintreply,
        arguments: {"complaintDetails": 2});
  }

  @override
  getComplaints() async {
    statusreqest = Statusreqest.loading;
    update();
    await getSharedData();
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
  getSharedData() async {
    final prefs = await SharedPreferences.getInstance();
    userUid = prefs.getString(Appshareds.userUid) ?? "";
  }

  @override
  void onInit() {
    getComplaints();
    super.onInit();
  }

  @override
  goToDetails(ComplaintModel complaintModel) {
    Get.toNamed(Approutes.userComplaintdetails, arguments: {
      "complaintModel": complaintModel,
    });
  }
}
