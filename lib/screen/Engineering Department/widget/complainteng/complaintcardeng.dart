import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../controller/Engineering Department/Complaintengineereng_controller.dart';
import '../../../user/widget/complaints/customcatogrey.dart';
import '../../../user/widget/complaints/customstatus.dart';
import '../../../user/widget/complaints/customtitlecomplaints.dart';
import '../../../user/widget/custombottomdetails.dart';

class ComplaintCardEng extends StatelessWidget {
  final ComplaintModel complaintModel;

  const ComplaintCardEng({
    required this.complaintModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controllerloc) => GetBuilder<ComplaintengineerengControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: Padding(
                padding: EdgeInsets.only(top: 10.h, left: 2.0.w, right: 2.w),
                child: Card(
                  margin: EdgeInsets.only(bottom: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    side: BorderSide(
                      color: Colors.blue, // ✅ لون الإطار
                      width: 2, // ✅ سمك الإطار
                    ),
                  ),
                  elevation: 6,
                  color: controllerloc.isDarkMode
                      ? Appcolor.colorbackground
                      : Colors.white,
                  shadowColor: Colors.grey.shade300,
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Customtitlecomplaints(
                            text: complaintModel.title.toString().tr),
                        SizedBox(height: 5.h),
                        Customcatogrey(
                          textone: 'department'.tr,
                          texttwo:
                              'complaintModel.department',
               
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
              ),
              statusreqest: controller.statusreqest)),
    );
  }
}
