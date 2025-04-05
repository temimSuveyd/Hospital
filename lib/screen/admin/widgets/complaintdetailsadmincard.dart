import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/controller/admin/complaints_details_admin_controller.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../core/constant/color.dart';
import '../../Engineering Department/widget/compliantdetails/customtextlocation.dart';
import '../../user/widget/complaintdetails/complaintsdescription.dart';
import '../../user/widget/complaintdetails/customcomplaindatetime.dart';
import '../../user/widget/complaintdetails/customrowicon.dart';
import '../../user/widget/complaintdetails/customtitlecomplaintdetails.dart';


class Complaintdetailsadmincard extends GetView<ComplaintdetailsadmincontrollerImp> {

  final String title;
  final String description;
  final String date;
  final String location;

  const Complaintdetailsadmincard({
    Key? key,

    required this.title,
    required this.description,
    required this.date,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: ( controllerloc) =>
     Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: const BorderSide(
            color: Colors.blue, // ✅ لون الإطار
            width: 2,          // ✅ سمك الإطار
          ),
        ),
        elevation: 5,
        color: controllerloc.isDarkMode? Appcolor.colorbackground:Appcolor.white,
        shadowColor: Colors.blue.shade300,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customtitlecomplaintdetails(text: title.isNotEmpty ? title : "No Title"),
              SizedBox(height: 10.h),
              Divider(color: Appcolor.primarycolor, thickness: 1.5),
              SizedBox(height: 10.h),
              Complaintsdescription(text: description.isNotEmpty ? description : "No description available."),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Customtextlocation(text: "Location".tr),
                  Customcomplaindatetime(
                    text: date.isNotEmpty ? date : "No date",
                    icon: Icons.calendar_today,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Customtextlocation(
                text: location.isNotEmpty ? location : "No location available",
              ),
              SizedBox(height: 50.h),

              // أزرار التحكم
              Customrowicon(
                iconBilling: Icons.folder,
                iconopen: Icons.open_in_browser,
                iconDelete: Icons.delete,
                onPressedBilling: () => print("Billing Pressed"),
                onPressedOpen: () => print("Open Pressed"),
                onPressedDelete: (){

                  controller.deleteComplaint();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
