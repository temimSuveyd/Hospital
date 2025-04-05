import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/customexitdilaog.dart';
import '../widget/customnavigationbottombarcontratctor.dart';
import '../../../controller/Contractor/homescreencontractor_controller.dart';

class ContractorHome extends StatelessWidget {
  ContractorHome({super.key});

  final HomescreencontractorControllerImp controller = Get.put(HomescreencontractorControllerImp());
//Localcontroller controllerloc=Localcontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: CustomAppBarApp(title: ''),
      bottomNavigationBar: Customnavigationbottombarcontratctor(),
      body: WillPopScope(
        onWillPop: () async {
          ExitDialogHelper.showExitDialog();
          return false; // منع الخروج المباشر
        },
        child: GetBuilder<HomescreencontractorControllerImp>(
          builder: (controller) => controller.pages.elementAt(controller.currentpage),
        ),
      ),
    );
  }}

