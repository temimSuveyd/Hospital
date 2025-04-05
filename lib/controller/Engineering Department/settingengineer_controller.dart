import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import '../../../services/servieses.dart';
import '../../../core/constant/APPtheme.dart';

class SettingengineerController extends GetxController {
  RxBool isDarkMode = false.obs; // ✅ RxBool لتحديث الواجهة مباشرة
  final Services services = Get.find();

  gotoprofileengineer() {
    Get.toNamed(Approutes.engineerProfile);
  }

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    services.sharedPreferences.setBool("isDarkMode", value);
    Get.changeTheme(isDarkMode.value ? themeEnglishDark : themeEnglish);
  }

  logOut() {
    Get.offAllNamed(Approutes.login);
    services.sharedPreferences.clear();
  }

  goToPassword() {
    Get.toNamed(Approutes.forgetpasword);
  }
}
