import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/Engineering Department/notification_engineer_controller.dart';
import '../../user/widget/customappbaruser.dart';
import '../widget/notificationitemengineer.dart';

class EngineerNotification extends StatelessWidget {
  const EngineerNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NotificationengineerControllerImp());
    return Scaffold(
      appBar: CustomAppBarApp(title: ""),
      body: GetBuilder<NotificationengineerControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: Padding(
                padding: EdgeInsets.all(10.0.r),
                child: ListView(
                  children: [
                    Customappbaruser(title: "Notification".tr),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      itemCount: controller.complaintsList.length,
                      itemBuilder: (context, index) => Notificationitemengineer(
                        complaintModel: ComplaintModel.formateJson(
                            controller.complaintsList[index]),
                      ),
                    ),
                  ],
                ),
              ),
              statusreqest: controller.statusreqest)),
    );
  }
}
