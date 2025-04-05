
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/homescreenadmin_controller.dart';
import '../../../localization/changelocal.dart';
import '../../shared/widgets/customexitdilaog.dart';
import '../widgets/customnavigatorbottombaradmin.dart';


// ignore: must_be_immutable
class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({super.key});

  final HomescreenadminControllerImp controller = Get.put(
      HomescreenadminControllerImp());
  Localcontroller controllerloc = Localcontroller();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenadminControllerImp>(builder: (controller) =>
        Scaffold(
          //appBar: CustomAppBarApp(title: '',),

          bottomNavigationBar: Customnavigatorbottombaradmin(),

          body: WillPopScope(
            onWillPop: () async {
              ExitDialogHelper.showExitDialog();
              return false; // منع الخروج المباشر
            },
            child: GetBuilder<HomescreenadminControllerImp>(
              builder: (controller) =>
                  controller.pages.elementAt(controller.currentpage),
            ),
          ),
        ));
  }


}