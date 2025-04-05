import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/admin/userscomplaint_controller.dart';
import '../widgets/complaintcardadmin.dart';

class AdminUserComplaints extends GetView<UserscomplaintControllerImp> {
  const AdminUserComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserscomplaintControllerImp());

    return Scaffold(
      appBar: CustomAppBarApp(title: 'Complaints'.tr),
      body: GetBuilder<UserscomplaintControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  itemCount: controller.complaintsList.length,
                  itemBuilder: (context, index) => Handlingdataview(
                      widget: Complaintcardadmin(
                        complaintModel: ComplaintModel.formateJson(
                            controller.complaintsList[index]),
                      ),
                      statusreqest: controller.statusreqest)),
              statusreqest: controller.statusreqest)),
    );
  }
}
