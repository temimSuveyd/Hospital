import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';

import '../../../controller/admin/complaints_details_admin_controller.dart';

import '../widgets/complaintdetailsadmincard.dart';

class AdminComplaintDetails extends StatelessWidget {
  const AdminComplaintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ComplaintdetailsadmincontrollerImp());
    return Scaffold(
      appBar: CustomAppBarApp(title: "Complaint details".tr),
      body: GetBuilder<ComplaintdetailsadmincontrollerImp>(
        builder: (controller) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w)
                .copyWith(top: 20.h, bottom: 150.h),
            child: Complaintdetailsadmincard(
              title: controller.complaintModel?.title ?? "No Title",
              description: controller.complaintModel?.description ??
                  "No description available.",
              date: controller.complaintModel?.userDate.toString() ?? "No date",
              location: controller.complaintModel?.location ??
                  "No location available",
            )),
      ),
    );
  }
}
