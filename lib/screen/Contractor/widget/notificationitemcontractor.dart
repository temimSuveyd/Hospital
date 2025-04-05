import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constant/Approutes.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/notificationmodel.dart';
import '../../../localization/changelocal.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;
  final VoidCallback onReply;

  const NotificationItem({
    Key? key,
    required this.notification,
    required this.onTap,
    required this.onReply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GetBuilder<Localcontroller>(
        builder: (controllerloc) => Card(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(
              color: controllerloc.isDarkMode ? Colors.blue : Appcolor.primarycolor,
              width: 2,
            ),
          ),
          elevation: 4,
          shadowColor: Colors.black26,
          color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      notification.isRead ? Icons.notifications_none : Icons.notifications_active,
                      color: notification.isRead ? Colors.grey : Appcolor.primarycolor,
                      size: 32,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        notification.title,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.primarycolor,
                          fontFamily: "cairo",
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: getStatusColor(notification.status),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        notification.status,
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
                GetBuilder<Localcontroller>(
                  builder: (controller) => Text(
                    notification.message,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: controller.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    notification.date,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Appcolor.primarycolor,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                // أزرار الإجراءات (تفاصيل + رد)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                        Get.toNamed(Approutes.contractorNotificationDetails, arguments: {
                          "notification":notification
                        });
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
                    ElevatedButton(
                      onPressed: onReply,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor.primarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Reply'.tr,
                        style: TextStyle(
                          color: Colors.white,
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
        ),
      ),
    );
  }

  // دالة لتحديد لون الحالة
  Color getStatusColor(String status) {
    if (status == "New".tr) {
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