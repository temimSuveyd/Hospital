
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/Engineering Department/homescreenengineer_controller.dart';

import '../../../localization/changelocal.dart';
import '../../shared/widgets/customexitdilaog.dart';
import '../widget/homepagescreenengineer/Customnavigatorbottombar.dart';

// ignore: must_be_immutable
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