import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/Contractor/settingcontractor_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/settingcard.dart';

class Settingcontractor extends StatelessWidget {
  Settingcontractor({super.key});

  final SettingcontractorController controller =
      Get.put(SettingcontractorController());
  final Localcontroller controllerloc = Get.put(Localcontroller());
  @override
  Widget build(BuildContext context) {
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
