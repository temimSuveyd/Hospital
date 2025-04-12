import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/users_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';

import '../../../controller/admin/contractoradmin_controller.dart';
import '../widgets/contractorcard.dart';

class AdminContractors extends StatelessWidget {
  const AdminContractors({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ContractoradminControllerImp());
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
          backgroundColor: local_controller.isDarkMode
              ? Appcolor.colorcarddark
              : Appcolor.white,
      appBar: CustomAppBarApp(
        title: 'contractors'.tr,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0.r),
        child: GetBuilder<ContractoradminControllerImp>(
            builder: (controller) => Handlingdataview(
                widget: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:controller.contractorsList.length,
                    itemBuilder: (context, index) {
                      return ContractorCard(
                        userModel: UserModel.formateJson(
                            controller.contractorsList[index]),
                      );
                    },
                  ),
                ),
                statusreqest: controller.statusreqest),)),
      ),
    );
  }
}
