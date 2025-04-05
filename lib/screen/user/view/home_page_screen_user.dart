import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import '../../../controller/user/home_screen_user_controller.dart';
import '../../../controller/user/user_home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../shared/widgets/customexitdilaog.dart';
import '../widget/homepageuser/custombottomappbar.dart';
import '../widget/homepageuser/customnavigatorbottombar.dart';

class Userhomepage extends StatelessWidget {
  Userhomepage({super.key});

  final HomescreencontrollerImp controller = Get.put(HomescreencontrollerImp());
  Localcontroller controllerloc = Localcontroller();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreencontrollerImp>(builder: (controller) =>
        Scaffold(
         // appBar: CustomAppBarApp(title: '',),

          bottomNavigationBar: Customnavigatorbottombar(),

          body: WillPopScope(
            onWillPop: () async {
              ExitDialogHelper.showExitDialog();
              return false; // منع الخروج المباشر
            },
            child: GetBuilder<HomescreencontrollerImp>(
              builder: (controller) =>
                  controller.pages.elementAt(controller.currentpage),
            ),
          ),
        ));
  }


}