import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/controller/Engineering%20Department/notification_engineer_controller.dart';
import 'package:hosptail/data/model/complaint_model.dart';
import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';

class Notificationitemengineer
    extends GetView<NotificationengineerControllerImp> {
  final ComplaintModel complaintModel;

  const Notificationitemengineer({
    Key? key,
    required this.complaintModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controllerloc) => Card(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(
            color:
                controllerloc.isDarkMode ? Colors.blue : Appcolor.primarycolor,
            width: 2,
          ),
        ),
        color:
            controllerloc.isDarkMode ? Appcolor.colorbackground : Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.notifications_active,
                    color: Colors.grey,
                    size: 32,
                  ),
                  SizedBox(width: 5.w),
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
                  const Spacer(),
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
              GetBuilder<Localcontroller>(
                builder: (controller) => Text(
                  complaintModel.description!,
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
                  complaintModel.userDate.toString(),
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
                    onPressed: () {
                      controller.goToDetails(complaintModel);
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
      ),
    );
  }

  // دالة لتحديد لون الحالة
  Color getStatusColor(String status) {
    if (status == "New".tr) {
      return Colors.red.shade300;
    } else if (status == "engineer received".tr) {
      return Colors.orange.shade300;
    } else if (status == "contractor received".tr) {
      return Colors.green.shade300;
    } else {
      return Colors.blueGrey;
    }
  }
}
