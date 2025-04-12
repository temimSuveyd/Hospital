import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/Engineering%20Department/widget/complainteng/complaintcardeng.dart';

import '../../../controller/Engineering Department/Complaintengineereng_controller.dart';

import '../../shared/widgets/customappbarapp.dart';

class EngineerComplaints extends StatelessWidget {
  const EngineerComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ComplaintengineerengControllerImp());
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
        appBar: CustomAppBarApp(title: "Complaint".tr),
        body: GetBuilder<ComplaintengineerengControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: Padding(
                padding: EdgeInsets.only(
                    top: 20.h, left: 2.0.w, right: 2.0.w, bottom: 20.h),
                child: ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      itemCount: controller.complaintsList.length,
                      itemBuilder: (context, index) => ComplaintCardEng(
                        complaintModel: ComplaintModel.formateJson(
                            controller.complaintsList[index]),
                      ),
                    ),
                  ],
                ),
              ),
              statusreqest: controller.statusreqest),
        ),
      ),
    );
  }
}
