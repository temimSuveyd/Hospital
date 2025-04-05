import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/color.dart';
import '../../../controller/Engineering Department/settingengineer_controller.dart';
import '../../../controller/user/setting_user_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/customdialog.dart';
import '../../shared/widgets/settingcard.dart';
import '../../user/widget/customappbaruser.dart';
import '../../user/widget/setting/custombottomlogout.dart';
import '../../user/widget/setting/customlisttile.dart';

class SettingsScreenEng extends StatelessWidget {
  SettingsScreenEng({super.key});

  final SettingengineerController controller =
      Get.put(SettingengineerController());
  final Localcontroller controllerloc = Get.put(Localcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(bottom: 30.w, top: 100.h, right: 20.w, left: 20.w),
        child: SettingsCard(
          onProfileTap: () {
            controller.gotoprofileengineer();
          },
          onPasswordTap: () {
            controller.goToPassword();
          },
          onLogout: () {
            controller.logOut();
          },
        ),
      ),
    );
  }
}
