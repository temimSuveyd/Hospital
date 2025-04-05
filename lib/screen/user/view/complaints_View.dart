import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import '../../../controller/user/complaint_view_user_controller.dart';
import '../../../data/dataScore/static/onboarding.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../widget/complaints/complaintcard.dart';

import '../widget/customappbaruser.dart';

class UserComplaints extends StatelessWidget {
  const UserComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ComplaintControllerImp(),
    );

    return Scaffold(
      appBar: CustomAppBarApp(title: "".tr),
      body: GetBuilder<ComplaintControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: ListView(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Customappbaruser(title: 'Complaints'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    itemCount: controller.complaintsList.length,
                    itemBuilder: (context, index) => ComplaintCard(
                      complaintModel: ComplaintModel.formateJson(
                          controller.complaintsList[index]),
                    ),
                  ),
                ],
              ),
              statusreqest: controller.statusreqest)),
    );
  }
}
