import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';
import 'package:hosptail/data/model/complaint_model.dart';

abstract class Notificationdetailsengineercontroller extends GetxController {
void deleteComplaint(String complaintId);
  void initData();
}

class NotificationdetailsengineercontrollerImp
    extends Notificationdetailsengineercontroller {
  ComplaintModel? complaintModel;


  ComplaintData complaintData = ComplaintData();


  @override
  void deleteComplaint(String complaintId) {
    try {
      Get.defaultDialog(
          title: "Delete Complaint",
          middleText: "Are you sure you want to delete this complaint?",
          onConfirm: ()async {
          await  complaintData.deleteComplaint(complaintId);
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

      update();
    } catch (e) {
      update();
      Get.showSnackbar(GetSnackBar(
        message: "Error deleting complaint",
        duration: Duration(seconds: 2),
        backgroundColor: Appcolor.primarycolor,
      ));
    }
  }



  @override
  void initData() {
    complaintModel = Get.arguments["complaintModel"];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
  

}
