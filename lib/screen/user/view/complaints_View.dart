import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../controller/user/complaint_view_user_controller.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../widget/complaints/complaintcard.dart';

class UserComplaints extends StatelessWidget {
  const UserComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ComplaintControllerImp(),
    );
 
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorcarddark
            : Appcolor.white,
        appBar: CustomAppBarApp(title: 'Complaints'.tr),
        body: GetBuilder<ComplaintControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: controller.complaintsList.length,
                itemBuilder: (context, index) => ComplaintCard(
                  complaintModel: ComplaintModel.formateJson(
                      controller.complaintsList[index]),
                ),
              ),
              statusreqest: controller.statusreqest),
        ),
      ),
    );
  }
}
