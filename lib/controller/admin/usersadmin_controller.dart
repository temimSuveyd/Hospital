import 'dart:developer';

import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UsersadminController extends GetxController {
  getUsersData();
  goToUserComplaints(String userUid);
  deleteUser(String userUid, String userRole);
}

class UsersadminControllerImp extends UsersadminController {
  int currentpage = 0;
  String? userUid;
  String? userRole;
  UserData userData = UserData();
  Statusreqest statusreqest = Statusreqest.success;
  List usersList = [];

  @override
  getUsersData() {
    statusreqest = Statusreqest.loading;
    update();

    try {
      userData.getAllUsersData().then(
        (value) {
          usersList = value.docs;
          if (usersList.isEmpty) {
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
    }
  }

  @override
  deleteUser(String userUid, String userRole) async {
    statusreqest = Statusreqest.loading;
    update();
    try {
      await userData.deleteUserData(userUid, userRole);
      Get.showSnackbar(GetSnackBar(
        title:"delete success",
        duration: Duration(seconds: 2),
        backgroundColor: Appcolor.primarycolor,
      ));
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  goToUserComplaints(String userUid) {
    Get.toNamed(Approutes.adminUserComplaints, arguments: {
      "user_id": userUid,
    });
  }

  @override
  void onInit() {
    getUsersData();
    super.onInit();
  }
}
