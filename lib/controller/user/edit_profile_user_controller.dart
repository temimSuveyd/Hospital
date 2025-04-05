import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/Approutes.dart';

abstract class EditProfileUserController extends GetxController {
  togglePasswordVisibility();
  chooseImage();
  getUserData();
  getSharedData();
}

class EditProfileUserControllerImp extends EditProfileUserController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  var selectedDepartment = "".obs;
  var selectedRole = "".obs;
  var isPasswordVisible = false.obs;
  var file = Rxn<File>();
  Statusreqest statusreqest = Statusreqest.success;
// user data
  UserData _userData = UserData();
  String? userUid;
  Map<String, dynamic>? userData;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userLocation;
  String? userDepartment;
  String? userRole;

  @override
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  Future<void> chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file.value = File(pickedFile.path);
    }
  }

  void updateProfile() {
    statusreqest = Statusreqest.loading;
    update();

    userName = usernameController.text.trim().isEmpty
        ? userName
        : usernameController.text.trim();

    userEmail = emailController.text.trim().isEmpty
        ? userEmail
        : emailController.text.trim();

    userPhone = phoneNumberController.text.trim().isEmpty
        ? userPhone
        : phoneNumberController.text.trim();

    userLocation = locationController.text.trim().isEmpty
        ? userLocation
        : locationController.text.trim();

    userDepartment = selectedDepartment.value.isEmpty
        ? userDepartment
        : selectedDepartment.value;
    userRole = selectedRole.value.isEmpty ? userRole : selectedRole.value;
    try {
      _userData.updateUserData(userUid!, userName!, userEmail!, userRole!,
          userDepartment!, userPhone!, userLocation!, "");
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }

    Get.showSnackbar(GetSnackBar(
        title: "Success",
        message: "Profile updated successfully".tr,
        duration: Duration(seconds: 2),
        backgroundColor: Appcolor.primarycolor));
  }

  gotomap() {
    Get.toNamed(Approutes.addlocationfrommap);
  }

  @override
  getUserData() async {
    statusreqest = Statusreqest.loading;
    update();
    try {
      await _userData.getUserData(userUid!).then(
        (value) {
          userData = value;
          userEmail = userData!["email"];
          userName = userData!["name"];
          userPhone = userData!["phoneNumber"];
          userLocation = userData!["location"];
          userRole = userData!["role"];
          userDepartment = userData!["department"];
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
  getSharedData() async {
    final prefs = await SharedPreferences.getInstance();
    userUid = prefs.getString(Appshareds.userUid) ?? "";
  }

  @override
  void onInit() async {
    await getSharedData();
    getUserData();
    super.onInit();
  }
}
