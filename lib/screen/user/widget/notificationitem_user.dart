import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/controller/user/notification_user_controller.dart';
import 'package:hosptail/controller/user/user_notification_details_controller.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../core/constant/color.dart';

class NotificationItem extends StatelessWidget {
  final ComplaintModel complaintModel;
   NotificationItem({
    Key? key,
    required this.complaintModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserNotificationControllerImp controllerNotification = Get.put(UserNotificationControllerImp());
    return GetBuilder<Localcontroller>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: controller.isDarkMode
              ? Appcolor.colorbackground
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: complaintModel.userDate == DateTime.now()
                ? Colors.grey.shade300
                : Appcolor.primarycolor,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان الإشعار
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.notifications_active,
                  color: Colors.grey,
                  size: 32,
                ),
                SizedBox(width: 5.h),
                Expanded(
                  child: Text(
                    complaintModel.title!,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.primarycolor,
                      fontFamily: "cairo",
                    ),
                  ),
                ),
    
                Spacer(),
                // حالة الإشعار
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: getStatusColor(complaintModel.status!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    complaintModel.status!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
    
            // نص الإشعار
            GetBuilder<Localcontroller>(
              builder: (controller) => Text(
                complaintModel.description!,
                style: TextStyle(
                  fontSize: 13.sp,
                  color:
                      controller.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo",
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 8.h),
    
            // تاريخ الإشعار
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    complaintModel.userDate.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Appcolor.primarycolor,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
  
                TextButton(
                  onPressed: () {
controllerNotification.goToDetails(complaintModel);
                  },
                  child: Text(
                    'Details'.tr,
                    style: TextStyle(
                      color: Appcolor.primarycolor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // دالة لتحديد لون الحالة
  Color getStatusColor(String status) {
    if (status == "unmistakable".tr) {
      return Colors.red.shade300;
    } else if (status == "in_progress".tr) {
      return Colors.orange.shade300;
    } else if (status == "completed".tr) {
      return Colors.green.shade300;
    } else {
      return Colors.blueGrey;
    }
  }
}
