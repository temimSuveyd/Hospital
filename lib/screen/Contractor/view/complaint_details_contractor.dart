import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/Contractor/complaint_details_contractor_controller.dart';
import '../../../controller/Engineering Department/complaint_details_controller.dart';
import '../../Engineering Department/widget/compliantdetails/customtextlocation.dart';
import '../../user/widget/complaintdetails/complaintsdescription.dart';
import '../../user/widget/complaintdetails/customcomplaindatetime.dart';
import '../../user/widget/complaintdetails/customrowicon.dart';
import '../../user/widget/complaintdetails/customtitlecomplaintdetails.dart';
import '../../user/widget/customappbaruser.dart';

class ContractorComplaintDetails
    extends GetView<ComplaintdetailscontractorControllerImp> {
  const ContractorComplaintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ComplaintdetailscontractorControllerImp());
    return Scaffold(
      appBar: CustomAppBarApp(title: "".tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w)
            .copyWith(top: 20.h, bottom: 150.h),
        child: ListView(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Customappbaruser(title: 'Complaint details'.tr),
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<Localcontroller>(
              builder: (controllerloc) => Card(
                margin: EdgeInsets.only(bottom: 15.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  side: BorderSide(
                    color: controllerloc.isDarkMode
                        ? Colors.blue
                        : Appcolor.primarycolor, // ✅ لون الإطار
                    width: 2, // ✅ سمك الإطار
                  ),
                ),
                elevation: 5,
                color: controllerloc.isDarkMode
                    ? Appcolor.colorbackground
                    : Colors.white,
                shadowColor: Colors.blue.shade300,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customtitlecomplaintdetails(
                          text: controller.complaintModel?.title ?? "No Title"),
                      SizedBox(height: 10.h),
                      Divider(color: Appcolor.primarycolor, thickness: 1.5),
                      SizedBox(height: 10.h),
                      Complaintsdescription(
                          text: controller.complaintModel?.description ??
                              "No description available."),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Customtextlocation(text: "Location".tr),
                          Customcomplaindatetime(
                            text: controller.complaintModel?.userDate
                                    .toString() ??
                                "No date",
                            icon: Icons.calendar_today,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Customtextlocation(
                        text: controller.complaintModel?.location ??
                            "No location available",
                      ),
                      SizedBox(height: 50.h),
                      // أزرار التحكم
                      Customrowicon(
                          iconBilling: Icons.folder,
                          iconopen: Icons.open_in_browser,
                          iconDelete: Icons.delete,
                          onPressedBilling: () => print("Billing Pressed"),
                          onPressedOpen: () => print("Open Pressed"),
                          onPressedDelete: () {
                            controller.deleteComplaint(
                                controller.complaintModel!.id!);
                          }),

                      GetBuilder<ComplaintdetailscontractorControllerImp>(
                        builder: (controller) => 
                      MaterialButton(
                          onPressed: () {
                            controller.receivedComplaint(
                                controller.complaintModel!.id!);
                          },
                          color: Appcolor.primarycolor,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          minWidth: 300,
                          child: Text(
                          controller.buttonText??"",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
