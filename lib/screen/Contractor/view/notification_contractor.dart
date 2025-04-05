import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/Contractor/notificationcontractor_controller.dart';
import '../../../data/model/notificationmodel.dart';
import '../../../localization/changelocal.dart';
import '../../user/widget/customappbaruser.dart';
import '../widget/notificationitemcontractor.dart';

class ContractorNotification extends StatelessWidget {
  final NotificationContractorController controller = Get.put(NotificationContractorController());

  ContractorNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarApp(title: "") ,
      body: Obx(
            () => controller.notifications.isEmpty
            ? Center(
          child: Text(
            'No notifications available'.tr,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        )
            : Padding(
              padding:  EdgeInsets.all(10.0.r),
              child: ListView(
                children: [
                  Customappbaruser(title: "Notification".tr),
                  ListView.builder(
                    shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            itemCount: controller.notifications.length,
                            itemBuilder: (context, index) {
                  final notification = controller.notifications[index];
                  return NotificationItem( notification: notification, onTap:(){
                         controller.goToNotificationDetails;
                  }, onReply: controller.gotoaddnotification,);
                            },
                          ),
                ],
              ),
            ),
      ),
    );
  }}

