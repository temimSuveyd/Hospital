import 'package:get/get.dart';
import '../../../services/servieses.dart';
import '../../../core/constant/APPtheme.dart';
import '../../core/constant/Approutes.dart';

abstract class SettingsController extends GetxController {
  void gotoprofile();
  void toggleDarkMode(bool value);
  void logOut();
}

class SettingsControllerImp extends SettingsController {
  RxBool isDarkMode = false.obs; // ✅ RxBool لتحديث الواجهة مباشرة
  final Services services = Get.find();



  @override
  gotoprofile() {
    Get.toNamed(Approutes.userProfile);
  }

  @override
  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    services.sharedPreferences.setBool("isDarkMode", value);
    Get.changeTheme(isDarkMode.value ? themeEnglishDark : themeEnglish);
  }

  @override
  logOut() {
    Get.offAllNamed(Approutes.login);
    services.sharedPreferences.clear();
  }


 goToPassword() {
    Get.toNamed(Approutes.forgetpasword);
  }

}
