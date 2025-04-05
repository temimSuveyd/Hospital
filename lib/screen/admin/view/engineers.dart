

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/data/model/users_model.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/admin/engineer_admin_controller.dart';
import '../widgets/engineercard.dart';

class AdminEngineersView extends StatelessWidget {
  const AdminEngineersView({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => EngineerControllerImp(),);
    return Scaffold(
      appBar:CustomAppBarApp(title: 'engineers'.tr) ,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<EngineerControllerImp>(
          builder: (controller)=>Handlingdataview(widget: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.engineersList.length,
              itemBuilder: (context, index) {
                return EngineerCard(userModel: UserModel.formateJson(controller.engineersList[index]),);
              },
            ), statusreqest: controller.statusreqest)
        ),
      ),
    );
  }
}
