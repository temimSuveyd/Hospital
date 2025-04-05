import 'dart:developer';

import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/core/functions/send_notification.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/complaint_model.dart';

abstract class ComplaintdetailscontractorController extends GetxController {
  void deleteComplaint(String complaintId);
  void initData();
  getContractorData();
  void receivedComplaint(String complaintId);
  getComplaintData();
  getsharedData();
  updateContractorData(String complaint_Status);
  chnageButtonText();
  sendNotifaction(String title);
}

class ComplaintdetailscontractorControllerImp
    extends ComplaintdetailscontractorController {
  ComplaintModel? complaintModel;
  ComplaintData _complaintData = ComplaintData();
  UserData _userData = UserData();
  Map<String, dynamic>? complaintData;
  Map<String, dynamic>? userData;
  Statusreqest statusreqest = Statusreqest.success;
  String? userUid;
  String? userRole;
  String? engineerToken;
  String? engineerAccessToken;
  String? userToken;
  String? userAccessToken;
  String? contractorName;
  String? contractorEmail;
  String? contractorPhone;
  String? contractorToken;
  String? contractorId;
  String? contractorAccessToken;

  String? complaintId;
  String? complaintStatus;
  String? buttonText;

  @override
  void deleteComplaint(String complaintId) {
    try {
      Get.defaultDialog(
        title: "Delete Complaint",
        middleText: "Are you sure you want to delete this complaint?",
        onCancel: () {
          Get.back();
        },
        onConfirm: () async {
          await _complaintData.deleteComplaint(complaintId);
          update();
          Get.close(1);
          Get.back();
        },
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "An error occurred while deleting the complaint.",
        backgroundColor: Appcolor.primarycolor,
        duration: const Duration(seconds: 2),
      );
    }
  }

  @override
  void initData() async {
    complaintModel = Get.arguments["complaintModel"];
    complaintId = complaintModel!.id;
    engineerAccessToken = complaintModel!.engineerAccessToken;
    engineerToken = complaintModel!.engineerToken;
    userToken = complaintModel!.userToken;
    userAccessToken = complaintModel!.userAccessToken;

    await getsharedData();
    getContractorData();
    getComplaintData();
  }

  @override
  void receivedComplaint(String _complaintId) {
    try {
      if (complaintStatus == "Engineer received") {
        show_Dialog(
          "received Complaint",
          "Are you sure you want receive this complaint?",
          () {
            updateContractorData("contractor received");
            sendNotifaction("contractor received");
          },
        );
      }
      if (complaintStatus == "contractor received") {
        show_Dialog(
          "complaint in progress",
          "Are you sure this complaint is in progress?",
          () {
            updateContractorData("in progress");
            sendNotifaction("in progress");
          },
        );
      }
      if (complaintStatus == "in progress") {
        show_Dialog(
          "complaint is completed",
          "Are you sure this complaint is completed?",
          () {
            updateContractorData("completed");
            sendNotifaction("completed");
          },
        );
      }
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  getContractorData() {
    statusreqest = Statusreqest.loading;
    update();
    try {
      _userData.getUserData(userUid!).then(
        (value) {
          log(value.toString());
          userData = value;
          contractorEmail = userData!["email"] ?? "";
          contractorName = userData!["name"] ?? "";
          contractorPhone = userData!["phoneNumber"] ?? "";
          contractorToken = userData!["token"] ?? "";
          contractorId = userData!["userId"] ?? "";
          contractorAccessToken = userData!["accessToken"] ?? "";
        },
      );
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  getComplaintData() {
    statusreqest = Statusreqest.loading;
    update();
    try {
      _complaintData.getComplaintsById(complaintId!).then(
        (value) {
          log(value.toString());
          complaintData = value;
          complaintStatus = complaintData!["complaint_status"];
          chnageButtonText();
        },
      );

      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  getsharedData() async {
    final prefs = await SharedPreferences.getInstance();
    userUid = prefs.getString(Appshareds.userUid) ?? "";
  }

  @override
  updateContractorData(String complaint_Status) {
    statusreqest = Statusreqest.loading;
    update();
    try {
      _complaintData.updateComplaintDataContractor(
        contractorName!,
        contractorEmail!,
        contractorPhone!,
        contractorToken!,
        contractorId!,
        complaintId!,
        complaint_Status,
        contractorAccessToken!,
      );
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  Future<dynamic> show_Dialog(
      String? title, String? middleText, void Function() onConfirm) {
    return Get.defaultDialog(
      title: title!,
      middleText: middleText!,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        onConfirm();
        Get.back();
        Get.back();

        Get.showSnackbar(GetSnackBar(
          title: "Success",
          message: "Complaint status updated successfully.",
          duration: const Duration(seconds: 2),
          backgroundColor: Appcolor.primarycolor,
        ));
      },
    );
  }

  @override
  chnageButtonText() {
    log("complaintStatus: $complaintStatus");
    if (complaintStatus == "Engineer received") {
      buttonText = "received the complaint".tr;
    } else if (complaintStatus == "contractor received") {
      buttonText = "complaint in progress".tr;
    } else if (complaintStatus == "in progress") {
      buttonText = "complaint is completed".tr;
    } else if (complaintStatus == "completed") {
      buttonText = "It has already finished".tr;
    }
    update();
  }

  @override
  void onInit() async {
    initData();

    super.onInit();
  }

  // send notification to engineer and user

  @override
  sendNotifaction(String title) {
    snedNotification(
        title, contractorName!, engineerToken!, engineerAccessToken!);

    snedNotification(title, contractorName!, userToken!, userAccessToken!);
  }
}
