

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/controller/auth/login_controller.dart';
import 'package:hosptail/controller/auth/sigup_controller.dart';

import '../controller/admin/homepageadmin_controller.dart';
import '../controller/admin/homescreenadmin_controller.dart';
import '../controller/auth/openscreen_controller.dart';
import '../controller/user/home_screen_user_controller.dart';
import '../controller/user/complaint_details_user_controller.dart';
import '../controller/user/setting_user_controller.dart';
import '../controller/user/user_home_controller.dart';
import '../services/servieses.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Services>(() => Services  (),fenix: true);
    ///////////////////user
    Get.lazyPut<UserHomeController>(() =>UserHomeController (),fenix: true);
    Get.lazyPut<HomescreencontrollerImp>(() =>HomescreencontrollerImp(),fenix: true);
    Get.lazyPut<OpenscreenController>(() =>OpenscreenController(),fenix: true);
    Get.lazyPut<ComplaintDetailsControllerImp>(() =>ComplaintDetailsControllerImp(),fenix: true);
    Get.lazyPut<SettingsControllerImp>(() =>SettingsControllerImp(),fenix: true);
    Get.lazyPut<HomescreenadminControllerImp>(() =>HomescreenadminControllerImp(),fenix: true);
    Get.lazyPut<HomepageadminControllerImp>(() =>HomepageadminControllerImp(),fenix: true);
    Get.lazyPut<LoginControllerImp>(() =>LoginControllerImp(),fenix: true);
    Get.lazyPut<SignupControllerImp>(() =>SignupControllerImp(),fenix: true);
    Get.putAsync(() => Services().init());
  }
}
