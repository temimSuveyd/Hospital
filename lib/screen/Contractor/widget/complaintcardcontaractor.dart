import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/user/widget/complaints/customcatogrey.dart';
import 'package:hosptail/screen/user/widget/complaints/customstatus.dart';
import '../../../controller/Contractor/complaintscon_controller.dart';
import '../../user/widget/complaints/customtitlecomplaints.dart';
import '../../user/widget/custombottomdetails.dart';


class Complaintcardcontaractor extends GetView<ComplaintscontractorControllerImp> {
final  ComplaintModel complaintmodel;

  const Complaintcardcontaractor( {
    super.key,
    required this.complaintmodel,

  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: ( controllerloc) =>
          Card(
            margin: EdgeInsets.only(bottom: 15.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
              side: BorderSide(
                color: controllerloc.isDarkMode ? Colors.blue : Appcolor.primarycolor, // ✅ لون الإطار
                width: 2, // ✅ سمك الإطار
              ),
            ),
            elevation: 6,
            color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
            shadowColor: Colors.blue.shade300,
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Customtitlecomplaints(text: complaintmodel.title!),
                  SizedBox(height: 5.h),
                 Customcatogrey(textone: 'Category'.tr,texttwo: complaintmodel.department!),
                 Customstatus(textone: 'Status'.tr,texttwo: complaintmodel.status!),
                 Customstatus(textone: 'Date'.tr,texttwo: complaintmodel.engineerDate.toString()),
                  SizedBox(height: 10.h),
                  Row(
                    children: [

                      Spacer(),
                    Custombottomdetails(
                      onPressed: () {
               controller.goToDetails(complaintmodel);
                      },
                    )
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}