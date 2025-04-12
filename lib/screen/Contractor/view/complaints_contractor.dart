import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/Contractor/complaintscon_controller.dart';
import '../widget/complaintcardcontaractor.dart';

class ContractorComplaints extends StatelessWidget {
  const ContractorComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ComplaintscontractorControllerImp(),
    );
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => 
     Scaffold(
      backgroundColor: local_controller.isDarkMode? Appcolor.colorbackground  : Appcolor.white,
      appBar: CustomAppBarApp(title: 'Complaints'.tr),
      body: GetBuilder<ComplaintscontractorControllerImp>(
        builder: (controller) => 
         ListView.builder(
           shrinkWrap: true,
           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
           itemCount: controller.complaintsList.length,
           itemBuilder: (context, index) => Complaintcardcontaractor(
             complaintmodel: ComplaintModel.formateJson(
                 controller.complaintsList[index]),
           ),
         ),
      ),
      ),

    );
  }
}
