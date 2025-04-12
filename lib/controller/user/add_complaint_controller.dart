import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Appimageasset.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/core/functions/send_notification.dart';
import 'package:hosptail/data/dataScore/remote/complaint_data.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddComplaintController extends GetxController {
  submitComplaint();
  getUseData();
  getSharedData();
  sendNotificationForEngineers();
  getAllEngineers();
}

class AddComplaintControllerImp extends AddComplaintController {
  final formKey = GlobalKey<FormState>();
  // complation data
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ComplaintData complaintData = ComplaintData();
  RxString selectedCategory = ''.obs;
  RxString selectedLocation = ''.obs;
  // user data
  UserData _userData = UserData();
  Map<String, dynamic>? userData;
  String? userUid;
  String? userRole;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userToken;
  String? userLocation;
  String? useraccessToken;
  // engineer data
  List engineersData = [];
  String? engineerAccessToken;

  List<String> categories = [
    "Electrical Engineering",
    "Mechanic  Engineering",
    "Electronic Engineering",
    "Civil Engineering"
  ];
  List<String> locations = ["a", "b", "c", "d"];
  Statusreqest statusreqest = Statusreqest.success;
  Localcontroller local_controller = Get.put(Localcontroller());
  @override
  void submitComplaint() {
    String complaintTitle = titleController.text.trim();
    String complaintDescription = descriptionController.text.trim();

    statusreqest = Statusreqest.loading;
    update();

    try {
      complaintData.addcomplaint(
        userName!,
        userUid!,
        userEmail!,
        userPhone!,
        userToken!,
        complaintTitle,
        complaintDescription,
        userLocation!,
        "unmistakable",
        selectedCategory.value,
        useraccessToken!,
      );
      getAllEngineers();
      Get.defaultDialog(
        title: "The complaint was sent somehow",
        middleText: "",
        actions: [LottieBuilder.asset(AppImagesasset.success)],
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
        onConfirm: () {
          Get.back();
        },
        buttonColor: Appcolor.primarycolor,
      );

      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  getUseData() async {
    await getSharedData();
    statusreqest = Statusreqest.loading;
    update();
    try {
      await _userData.getUserData(userUid!).then(
        (value) {
          userData = value!;
        },
      );
      userName = userData!['name'];
      userEmail = userData!['email'];
      userPhone = userData!['phoneNumber'];
      userToken = userData!['token'];
      useraccessToken = userData!['accessToken'];
      userLocation = userData!['location'];

      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  getSharedData() async {
    final prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString(Appshareds.role) ?? "";
    userUid = prefs.getString(Appshareds.userUid) ?? "";
  }

  @override
  getAllEngineers() {
    String complaintDepartment = selectedCategory.value;
    statusreqest = Statusreqest.loading;
    update();
    try {
      _userData.getAllEngineersData(complaintDepartment).then((value) {
        engineersData = value.docs;
        sendNotificationForEngineers();
      });

      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  sendNotificationForEngineers() {
    String? _accessToken;
    String? _token;
    for (var data in engineersData) {
      _accessToken = data["accessToken"];
      _token = data["token"];
      snedNotification(
          "User added a complaint", userName!, _token!, _accessToken!);
    }
  }

  @override
  void onInit() {
    getUseData();
    super.onInit();
  }
}
