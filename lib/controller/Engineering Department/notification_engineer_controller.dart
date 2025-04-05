import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationengineerController extends GetxController {
  getNotification();
  getSharedData();
  goToDetails(ComplaintModel complaintModel);
}

class NotificationengineerControllerImp extends NotificationengineerController {
  ComplaintModel? complaintModel;
  String? userUid;
  ComplaintData _complaintData = ComplaintData();
  Statusreqest statusreqest = Statusreqest.success;
  var complaintsList = [].obs;

  @override
  getNotification() async {
    statusreqest = Statusreqest.loading;
    update();
    await getSharedData();
    try {
      _complaintData.getEngineerNotifications(userUid!).listen(
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
  goToDetails(ComplaintModel complaintModel) {
    Get.toNamed(Approutes.engineerComplaintDetails, arguments: {
      "complaintModel": complaintModel,
    });
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
