import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/controller/user/user_notification_details_controller.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import 'package:hosptail/screen/user/widget/customappbaruser.dart';
import '../../Contractor/widget/builddetailditem.dart';
import '../../Contractor/widget/statusbadge.dart';

class UserNotificationDetails extends StatelessWidget {
  const UserNotificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserNotificationDetailsControllerImp());
    return  GetBuilder<Localcontroller>(
      builder: (loacl_controller) => Scaffold(
          backgroundColor: loacl_controller.isDarkMode
              ? Appcolor.colorbackground
              : Appcolor.white,
      appBar: CustomAppBarApp(
        title: 'notification_details'.tr,
      ),
      body: GetBuilder<UserNotificationDetailsControllerImp>(
        builder: (controller) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // تفاصيل العنوان
              DetailItem(
                icon: Icons.title,
                label: 'notification_title'.tr,
                value: controller.complaintModel!.title ?? "no title",
              ),
              SizedBox(height: 30.h),

              // تفاصيل الرسالة
              DetailItem(
                  icon: Icons.message,
                  label: 'notification_message'.tr,
                  value: controller.complaintModel!.description ??
                      "no description"),
              SizedBox(height: 30.h),

              // تاريخ الإشعار + الحالة
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: DetailItem(
                        icon: Icons.event,
                        label: 'notification_date'.tr,
                        value: controller.complaintModel!.userDate!.toString()),
                  ),
                  StatusBadge(status: controller.complaintModel!.status!),
                ],
              ),
              SizedBox(height: 50.h),

              // MarkAsReadButton(
              //   onPressed: () {
              //     // controller.markNotificationAsRead();
              //   },
              // ),

              const SizedBox(height: 24),
            ],
          )),
        ),
      ),
      ),

    );
  }
}
