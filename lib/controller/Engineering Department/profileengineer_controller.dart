import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileengineerController extends GetxController {
  gotoeditprofilepage();
  deleteAccount();
  getUserData();
  getSharedData();
}

class ProfileengineerControllerImp extends ProfileengineerController {
  Statusreqest statusreqest = Statusreqest.success;
// user data
  UserData _userData = UserData();
  String? userUid;
  Map<String, dynamic>? userData;
  String? userName;
  String? userEmail;
  String? userRole;

  @override
  gotoeditprofilepage() {
    Get.toNamed(Approutes.engineerEditProfile);
  }

  @override
  deleteAccount() async {
    statusreqest = Statusreqest.loading;
    update();

    try {
      _userData.deleteUserData(userUid!, userRole!);
      await FirebaseAuth.instance.currentUser!.delete();
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }

    Get.snackbar("Success", "Account deleted successfully".tr);
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
          userRole = userData!["role"];
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
