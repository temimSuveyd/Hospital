import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/admin/widgets/complaintdepartmentcard.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/admin/department_complaint_controller.dart';

class AdminDepartmentComplaint extends StatelessWidget {
  const AdminDepartmentComplaint({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DepartmentcomplaintControllerImp());
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
          backgroundColor: local_controller.isDarkMode
              ? Appcolor.colorcarddark
              : Appcolor.white,
      appBar: CustomAppBarApp(title: 'Complaints'.tr),
      body: GetBuilder<DepartmentcomplaintControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: controller.complaintsList.length,
                itemBuilder: (context, index) => Complaintdepartmentcard(
                  complaintModle: ComplaintModel.formateJson(
                      controller.complaintsList[index]),
                ),
              ),
              statusreqest: controller.statusreqest))),
    );
  }
}
