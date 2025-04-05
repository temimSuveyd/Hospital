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

abstract class ComplaintDetailsEngController extends GetxController {
  void deleteComplaint();
  void initData();
  sendComplaintToContractor();
  getEngineerData();
  getsharedData();
  updateEngineerData();
  sendNotification();
}

class ComplaintDetailsEngControllerImp extends ComplaintDetailsEngController {
  ComplaintModel? complaintModel;
  ComplaintData _complaintData = ComplaintData();
  UserData _userData = UserData();
  Map<String, dynamic>? complaintData;
  Map<String, dynamic>? userData;
  Statusreqest statusreqest = Statusreqest.success;
  String? userUid;
  String? userRole;
  String? userToken;
  String? userAccessToken;
  String? engineerName;
  String? engineerEmail;
  String? engineerPhone;
  String? engineerToken;
  String? engineerId;
  String? engineerAccessToken;
  String? complaintId;
  String? complaintStatus;

  @override
  void deleteComplaint() {
    try {
      Get.defaultDialog(
        title: "Delete Complaint",
        middleText: "Are you sure you want to delete this complaint?",
        onCancel: () {
          Get.back();
        },
        onConfirm: () async {
          await _complaintData.deleteComplaint(complaintId!);
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
  void initData() {
    complaintModel = Get.arguments["complaintModel"];
    complaintId = complaintModel!.id;
    complaintStatus = complaintModel!.status;
    userToken = complaintModel!.userToken;
    userAccessToken = complaintModel!.userAccessToken;
    log(userToken!);
    getEngineerData();
  }

  @override
  sendComplaintToContractor() {
    if (complaintStatus == "unmistakable") {
      try {
        show_dialog("send complaint",
            "Are you sure you want to send this complaint to the contractor?",
            () {
          updateEngineerData();
          sendNotification();
        });
      } catch (e) {
        statusreqest = Statusreqest.parsingError;
        update();
      }
    } else {
      show_dialog("send complaint", "you already sent", () {});
    }
  }

  @override
  getEngineerData() async {
    statusreqest = Statusreqest.loading;
    update();
    await getsharedData();
    try {
      _userData.getUserData(userUid!).then(
        (value) {
          userData = value;
          engineerEmail = userData!["email"] ?? "";
          engineerName = userData!["name"] ?? "";
          engineerPhone = userData!["phoneNumber"] ?? "";
          engineerToken = userData!["token"] ?? "";
          engineerId = userData!["userId"] ?? "";
          engineerAccessToken = userData!["accessToken"] ?? "";
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
  updateEngineerData() {
    statusreqest = Statusreqest.loading;
    update();
    try {
      _complaintData.updateComplaintDataEngineer(
          complaintId!,
          engineerName!,
          engineerEmail!,
          engineerPhone!,
          engineerToken!,
          engineerId!,
          engineerAccessToken!);
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  sendNotification() {
    snedNotification(
        "engineer received", engineerName!, userToken!, userAccessToken!);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  Future<dynamic> show_dialog(
      String title, String middleText, void Function() onConfirm) {
    return Get.defaultDialog(
      title: title,
      middleText: middleText,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        onConfirm();
        Get.back();
        Get.back();
      },
    );
  }
}
