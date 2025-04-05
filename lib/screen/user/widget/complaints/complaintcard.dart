import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../controller/user/complaint_view_user_controller.dart';
import '../../../../core/constant/Approutes.dart';
import '../custombottomdetails.dart';
import 'customcatogrey.dart';
import 'customstatus.dart';
import 'customtitlecomplaints.dart';

class ComplaintCard extends GetView<ComplaintControllerImp> {
  final ComplaintModel complaintModel;

  const ComplaintCard({
    super.key,
    required this.complaintModel,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controllerloc) => Card(
        margin: EdgeInsets.only(bottom: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(
            color: Colors.blue, // ✅ لون الإطار
            width: 2, // ✅ سمك الإطار
          ),
        ),
        elevation: 6,
        color:
            controllerloc.isDarkMode ? Appcolor.colorbackground : Colors.white,
        shadowColor: Colors.blue.shade300,
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customtitlecomplaints(text: complaintModel.title!),
              SizedBox(height: 5.h),
              Customcatogrey(
                textone: 'department'.tr,
                texttwo: complaintModel.department!,
       
              ),
              Customstatus(
                textone: 'Status'.tr,
                texttwo: complaintModel.status!,
      
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Spacer(),
                  Custombottomdetails(
                    onPressed: () {
                      controller.goToDetails(complaintModel);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
