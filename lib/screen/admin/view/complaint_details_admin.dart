import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';

import '../../../controller/admin/complaints_details_admin_controller.dart';

import '../widgets/complaintdetailsadmincard.dart';

class AdminComplaintDetails extends StatelessWidget {
  const AdminComplaintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ComplaintdetailsadmincontrollerImp());
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
          backgroundColor: local_controller.isDarkMode
              ? Appcolor.colorcarddark
              : Appcolor.white,
      appBar: CustomAppBarApp(title: "Complaint details".tr),
      body: GetBuilder<ComplaintdetailsadmincontrollerImp>(
        builder: (controller) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w)
                .copyWith(top: 20.h, bottom: 150.h),
            child: Complaintdetailsadmincard(
              title: controller.complaintModel?.title ?? "",
              description: controller.complaintModel?.description ??
                  "",
              date: controller.complaintModel?.userDate.toString() ?? "",
              location: controller.complaintModel?.location ??
                  "",
            )),
      ),)
    );
  }
}
