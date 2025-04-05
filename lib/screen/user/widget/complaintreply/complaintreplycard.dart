import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../controller/user/complaintreply_controller.dart';
import '../../../../controller/user/complaint_view_user_controller.dart';
import '../../../../core/constant/Approutes.dart';
import '../complaints/customcatogrey.dart';
import '../complaints/customstatus.dart';
import '../complaints/customtitlecomplaints.dart';
import '../custombottomdetails.dart';


class Complaintreplycard extends GetView<ComplaintreplyController> {
  final ComplaintreplyController controller;
  final int index;
  final List complaintsList;

  const Complaintreplycard({
    super.key,
    required this.controller,
    required this.index,
    required this.complaintsList,
  });

  @override
  Widget build(BuildContext context) {
    var complaint = complaintsList[index];
    return GetBuilder<Localcontroller>(
      builder: ( controller) =>
          Card(
            margin: EdgeInsets.only(bottom: 15.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
            elevation: 6,
            color:controller.isDarkMode?Colors.black: Colors.white,
            shadowColor: Colors.grey.shade300,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Customtitlecomplaints(text: complaint.title.toString().tr),
                  SizedBox(height: 5.h),
              Customcatogrey(textone: 'Category'.tr,texttwo: "complaintmodel.department!"),
                 Customstatus(textone: 'Status'.tr,texttwo: "complaintmodel.status!"),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Custombottomdetails(
                        onPressed: () {
                          Get.toNamed(Approutes.userComplaintdetails, arguments: {
                            "complaint": complaintsList[index]
                          });
                        },
                      ),
                      Spacer(),
                      //TextButton(onPressed: (){}, child: Text("Reply",style: TextStyle(color: Appcolor.primarycolor),))
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}