import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import '../../../controller/Engineering Department/homescreenengineer_controller.dart';
import '../../../controller/user/home_screen_user_controller.dart';
import '../../../controller/user/user_home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../shared/widgets/customexitdilaog.dart';
import '../../user/widget/homepageuser/customnavigatorbottombar.dart';
import '../widget/homepagescreenengineer/Customnavigatorbottombar.dart';

class Engineerhomepage extends StatelessWidget {
  Engineerhomepage({super.key});

  final HomescreenengineerControllerImp controller = Get.put(
      HomescreenengineerControllerImp());
  Localcontroller controllerloc = Localcontroller();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenengineerControllerImp>(builder: (controller) =>
        Scaffold(
         // appBar: CustomAppBarApp(title: '',),

          bottomNavigationBar: Customnavigatorbottombareng(),

          body: WillPopScope(
            onWillPop: () async {
              ExitDialogHelper.showExitDialog();
              return false; // منع الخروج المباشر
            },
            child: GetBuilder<HomescreenengineerControllerImp>(
              builder: (controller) =>
                  controller.pages.elementAt(controller.currentpage),
            ),
          ),
        ));
  }

}