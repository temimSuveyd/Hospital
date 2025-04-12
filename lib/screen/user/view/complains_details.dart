import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/user/complaint_details_user_controller.dart';
import '../../Engineering Department/widget/compliantdetails/customtextlocation.dart';
import '../widget/complaintdetails/complaintsdescription.dart';
import '../widget/complaintdetails/customcomplaindatetime.dart';
import '../widget/complaintdetails/customrowicon.dart';
import '../widget/complaintdetails/customtitlecomplaintdetails.dart';
import '../widget/customappbaruser.dart';

class UserComplaintdetails extends StatelessWidget {
  const UserComplaintdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ComplaintDetailsControllerImp controller =
        Get.put(ComplaintDetailsControllerImp());
    // final SettingsController controllersett = Get.put(SettingsController());
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => 
   Scaffold(
    backgroundColor: local_controller.isDarkMode ? Appcolor.colorbackground : Appcolor.white,
        appBar: CustomAppBarApp(title: 'Complaint details'.tr),
        body: GetBuilder<ComplaintDetailsControllerImp>(
            builder: (controller) => Handlingdataview(
                widget: Padding(
                  padding: EdgeInsets.only(
                      bottom: 150.w, top: 20.h, left: 20.w, right: 20.w),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      GetBuilder<Localcontroller>(
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
                          shadowColor: Colors.grey.shade300,
                          child: Padding(
                            padding: EdgeInsets.all(20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Customtitlecomplaintdetails(
                                  text: controller.complaintModel?.title
                                          .toString() ??
                                      "",
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                    color: Appcolor.primarycolor, thickness: 1.5),
                                SizedBox(height: 10.h),
                                Complaintsdescription(
                                  text: controller.complaintModel?.description
                                          .toString() ??
                                      "",
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Customtextlocation(text: "Location"),
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
                                Customrowicon(
                                  iconBilling: Icons.folder,
                                  iconopen: Icons
                                      .open_in_browser, // هنا مرر أي أيقونة تريدها
                                  iconDelete: Icons.delete,
                                  onPressedBilling: () {
                                    print("Billing Pressed");
                                  },
                                  onPressedOpen: () {
                                    print("Open Pressed");
                                  },
                                  onPressedDelete: () {
                                    controller.deleteComplaint();
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                statusreqest: controller.statusreqest)),
      ),
    );
  }
}
