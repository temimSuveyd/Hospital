import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/screen/shared/widgets/customappbar.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import 'package:hosptail/screen/user/widget/customappbaruser.dart';
import '../../../controller/Contractor/addnotifcationcontroller.dart';
import '../../../core/constant/color.dart';
import '../widget/customaddnotification.dart';
import '../widget/customdropdownstaus.dart';
import '../widget/customnotificationtextfiled.dart';

class ContractorAddNotification extends StatelessWidget {
  final AddNotificationController controller = Get.put(AddNotificationController());

  ContractorAddNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarApp(title: "") ,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customappbaruser(title: "add notification".tr),
               SizedBox(height: 50.h),
              Customnotificationtextfiled (
                label:'notification_title'.tr,
                controller: controller.titleController,
                icon: Icons.title,
                maxLines: 1,
              ),


              const SizedBox(height: 24),
              Customnotificationtextfiled (
                label:'notification_message'.tr,
                controller: controller.messageController,
                icon:  Icons.message,
                maxLines: 4,
              ),

              const SizedBox(height: 24),
              CustomStatusDropdown(controller: controller),
              const SizedBox(height: 40),
              CustomAddButton(onPressed: controller.addNotification),


            ],
          ),
        ),
      ),
    );
  }}
