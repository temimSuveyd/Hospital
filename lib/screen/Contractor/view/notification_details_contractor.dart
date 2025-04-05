import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import 'package:hosptail/screen/user/widget/customappbaruser.dart';
import '../../../../controller/Contractor/notificationdetailscontractor.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/Engineering Department/notificationdetailscontroller.dart';
import '../widget/builddetailditem.dart';
import '../widget/markreadbuttom.dart';
import '../widget/statusbadge.dart';

class ContractorNotificationDetails extends StatelessWidget {
  ContractorNotificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationDetailsController controller = Get.put(NotificationDetailsController());
    return Scaffold(
      appBar:CustomAppBarApp(title: '',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: GetBuilder<NotificationDetailsController>(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                // الشريط العلوي المخصص
                Customappbaruser(title: 'notification_details'.tr),

                SizedBox(height: 40.h),

                // تفاصيل العنوان
                DetailItem(
                  icon: Icons.title,
                  label: 'notification_title'.tr,
                  value: controller.notification!.title,
                ),
                SizedBox(height: 30.h),

                // تفاصيل الرسالة
                DetailItem(icon:Icons.message, label: 'notification_message'.tr, value:controller.notification!.message),
                SizedBox(height: 30.h),

                // تاريخ الإشعار + الحالة
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child:  DetailItem(icon:Icons.event,label:  'notification_date'.tr,value:  controller.notification!.date),
                    ),
          StatusBadge(status: controller.notification!.status),

                  ],
                ),
                SizedBox(height: 50.h),

                MarkAsReadButton(
                  onPressed: () {
                   // controller.markNotificationAsRead();
                  },
                ),


                const SizedBox(height: 24),
           ],
            )

          ),
        ),
      ),
    );
  }




}
