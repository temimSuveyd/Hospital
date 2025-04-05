import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/services/servieses.dart';

class SettingadminController extends GetxController {
  Services services = Get.find<Services>();

  void gotoadminprofile() {
    Get.toNamed(Approutes.adminProfile);
  }

  logOut() {
    final shaerd = services.sharedPreferences;
    Get.offAllNamed(Approutes.login);
    shaerd.clear();
  }

  goToPassword() {
    Get.toNamed(Approutes.forgetpasword);
  }
}
