import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/controller/user/notification_user_controller.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../widget/notificationitem_user.dart';

class UserNotificationPage extends StatelessWidget {
  const UserNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserNotificationControllerImp());

    return GetBuilder<Localcontroller>(
      builder: (loacl_controller) => Scaffold(
          backgroundColor: loacl_controller.isDarkMode
              ? Appcolor.colorbackground
              : Appcolor.white,
          appBar: CustomAppBarApp(title: "Notification".tr),
          body: GetBuilder<UserNotificationControllerImp>(
              builder: (controller) => Handlingdataview(
                  widget: Padding(
                    padding: EdgeInsets.all(10.0.r),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.complaintsList.length,
                          itemBuilder: (context, index) {
                            return NotificationItem(
                              complaintModel: ComplaintModel.formateJson(
                                  controller.complaintsList[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  statusreqest: controller.statusreqest))),
    );
  }
}
