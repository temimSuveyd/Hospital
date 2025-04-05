import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';

import '../../data/model/complaint_model.dart';

abstract class Complaintdetailsadmincontroller extends GetxController {
  initData();
}

class ComplaintdetailsadmincontrollerImp
    extends Complaintdetailsadmincontroller {
  ComplaintModel? complaintModel;
  Statusreqest statusreqest = Statusreqest.success;
  ComplaintData complaintData = ComplaintData();
  String? complaintId;
  @override
  initData() {
    complaintModel = Get.arguments["complaintModel"];
    complaintId = complaintModel!.id;
  }
  Future<dynamic> show_dialog() {
    return Get.defaultDialog(
        title: "Delete Complaint",
        middleText: "Are you sure you want to delete this complaint?",
        onConfirm: () async {
          await complaintData.deleteComplaint(complaintId!);
          Get.back();
          Get.showSnackbar(GetSnackBar(
            message: "Complaint deleted successfully",
            duration: Duration(seconds: 2),
            backgroundColor: Appcolor.primarycolor,
          ));
        },
        onCancel: () {
          Get.back();
        },
        buttonColor: Appcolor.primarycolor);
  }

  void deleteComplaint() {
    statusreqest = Statusreqest.loading;
    update();
    try {
      show_dialog();
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
      Get.showSnackbar(GetSnackBar(
        message: "Error deleting complaint",
        duration: Duration(seconds: 2),
        backgroundColor: Appcolor.primarycolor,
      ));
    }
  }

  @override
  void onInit() {
    initData();

    super.onInit();
  }
}
