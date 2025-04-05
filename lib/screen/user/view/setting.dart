import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/user/setting_user_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/settingcard.dart';

class SettingsScreen extends GetView<SettingsControllerImp> {
  SettingsScreen({super.key});

  final Localcontroller controllerloc = Get.put(Localcontroller());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsControllerImp());
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
              bottom: 30.w, top: 100.h, right: 20.w, left: 20.w),
          child: SettingsCard(
            onProfileTap: () {
              controller.gotoprofile();
            },
            onPasswordTap: () {
              controller.goToPassword();
            },
            onLogout: () {
              controller.logOut();
            },
          )),
    );
  }
}
