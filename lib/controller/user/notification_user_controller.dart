import 'dart:developer';

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

abstract class NotificationUserController extends GetxController {
  getNotification();
  getSharedData();
  goToDetails(ComplaintModel complaintModel);
}

class UserNotificationControllerImp extends NotificationUserController {
  ComplaintModel? complaintModel;
  String? userUid;
  ComplaintData _complaintData = ComplaintData();
  Statusreqest statusreqest = Statusreqest.success;
  var complaintsList = [].obs;

  @override
  getNotification(){
    statusreqest = Statusreqest.loading;
    update();
    try {

      log(userUid!);
      _complaintData.getUserNotifactions(userUid!).listen(
        (event) {
          complaintsList.value = event.docs;
          update();
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
    Get.toNamed(Approutes.userNotificationDetails, arguments: {
      "complaintModel" : complaintModel,
    });
  }

  @override
  onInit() async{
   await getSharedData();
    getNotification();
    super.onInit();
  }
}
