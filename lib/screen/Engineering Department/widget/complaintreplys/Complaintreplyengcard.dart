import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../controller/Engineering Department/Complaintengineereng_controller.dart';
import '../../../../controller/Engineering Department/complaintreplys_controller.dart';
import '../../../../controller/user/complaint_view_user_controller.dart';
import '../../../../core/constant/Approutes.dart';
import '../../../user/widget/complaints/customcatogrey.dart';
import '../../../user/widget/complaints/customstatus.dart';
import '../../../user/widget/complaints/customtitlecomplaints.dart';
import '../../../user/widget/custombottomdetails.dart';
import 'customtextreply.dart';


class Complaintreplyengcard extends GetView<ComplaintreplysController> {
  final ComplaintreplysController controller;
  final int index;
  final List complaintsList;

  const Complaintreplyengcard({
    super.key,
    required this.controller,
    required this.index,
    required this.complaintsList,
  });

  @override
  Widget build(BuildContext context) {
    var complaint = complaintsList[index];
    return GetBuilder<Localcontroller>(
      builder: ( controllerloc) =>
          Padding(
            padding:  EdgeInsets.all(8.r),
            child: Card(
              margin: EdgeInsets.only(bottom: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
                side: BorderSide(
                  color:  Colors.blue , // ✅ لون الإطار
                  width: 2, // ✅ سمك الإطار
                ),
              ),
              elevation: 6,
              color:controllerloc.isDarkMode?Colors.black: Colors.white,
              shadowColor: Colors.grey.shade300,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtextreply(text: "${complaint.replycomplaint.toString().tr}"),
                    SizedBox(height: 5.h),
                   // Customcatogrey(text: 'department'.tr + ': ${complaint.category.toString().tr}'),
                   // Customstatus(text: 'Status'.tr + ': ${complaint.status.toString().tr}'),
                    SizedBox(height: 10.h),

                  ],
                ),
              ),
            ),
          ),
    );
  }
}