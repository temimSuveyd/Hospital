import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/admin/settingadmin_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/settingcard.dart';


class Settingadmin extends StatelessWidget {
  Settingadmin({super.key});

  final SettingadminController controller = Get.put(SettingadminController());
  final Localcontroller controllerloc = Get.put(Localcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
              bottom: 30.w, top: 100.h, right: 20.w, left: 20.w),
          child: SettingsCard(
            onProfileTap: () {
              controller.gotoadminprofile();
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
