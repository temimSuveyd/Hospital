import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../controller/admin/department_complaint_controller.dart';
import '../../user/widget/complaints/customcatogrey.dart';
import '../../user/widget/complaints/customstatus.dart';
import '../../user/widget/complaints/customtitlecomplaints.dart';
import '../../user/widget/custombottomdetails.dart';


class Complaintdepartmentcard extends GetView<DepartmentcomplaintControllerImp> {
final ComplaintModel complaintModle;

  const Complaintdepartmentcard({
    super.key,required this.complaintModle

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
                color:  Colors.blue, // ✅ لون الإطار
                width: 2, // ✅ سمك الإطار
              ),
            ),
            elevation: 6,
            color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
            shadowColor: Colors.grey.shade300,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Customtitlecomplaints(text: complaintModle.title!),
                  SizedBox(height: 5.h),
                         Customcatogrey(textone: 'Category'.tr,texttwo: complaintModle.department!),
                 Customstatus(textone: 'Status'.tr,texttwo: complaintModle.status!),
                  SizedBox(height: 10.h),
                  Row(
                    children: [

                      Spacer(),
                      Custombottomdetails(
                        onPressed: () {
              controller.gotoComplaintDetails(complaintModle);
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