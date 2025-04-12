import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/Engineering Department/notification_engineer_controller.dart';
import '../widget/notificationitemengineer.dart';

class EngineerNotification extends StatelessWidget {
  const EngineerNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NotificationengineerControllerImp());
    return GetBuilder<Localcontroller>(
        builder: (local_controller) => Scaffold(
              backgroundColor: local_controller.isDarkMode
                  ? Appcolor.colorbackground
                  : Appcolor.white,
              appBar: CustomAppBarApp(title: "Notification".tr),
              body: GetBuilder<NotificationengineerControllerImp>(
                  builder: (controller) => Handlingdataview(
                      widget: Padding(
                        padding: EdgeInsets.all(10.0.r),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          itemCount: controller.complaintsList.length,
                          itemBuilder: (context, index) =>
                              Notificationitemengineer(
                            complaintModel: ComplaintModel.formateJson(
                                controller.complaintsList[index]),
                          ),
                        ),
                      ),
                      statusreqest: controller.statusreqest)),
            ));
  }
}
