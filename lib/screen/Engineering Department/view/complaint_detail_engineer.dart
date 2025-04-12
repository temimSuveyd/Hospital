import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/data/dataScore/static/onboarding.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/Engineering Department/complaint_details_controller.dart';
import '../../user/widget/complaintdetails/complaintsdescription.dart';
import '../../user/widget/complaintdetails/customcomplaindatetime.dart';
import '../../user/widget/complaintdetails/customrowicon.dart';
import '../../user/widget/complaintdetails/customtitlecomplaintdetails.dart';
import '../../user/widget/customappbaruser.dart';
import '../widget/compliantdetails/customtextlocation.dart';

class EngineerComplaintDetails
    extends GetView<ComplaintDetailsEngControllerImp> {
  const EngineerComplaintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ComplaintDetailsEngControllerImp());
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => Scaffold(
        backgroundColor: local_controller.isDarkMode
            ? Appcolor.colorbackground
            : Appcolor.white,
        appBar: CustomAppBarApp(title: "Complaint details".tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w)
              .copyWith(top: 20.h, bottom: 150.h),
          child: GetBuilder<Localcontroller>(
            builder: (controllerloc) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
                side: BorderSide(
                  color: Colors.blue, // ✅ لون الإطار
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
                          text:
                              controller.complaintModel?.userDate.toString() ??
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
                          controller.deleteComplaint();
                        }),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          controller.sendComplaintToContractor();
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none),
                        color: Appcolor.primarycolor,
                        minWidth: 200,
                        child: Text("take complaint".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
