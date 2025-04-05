import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/screen/shared/widgets/customappbar.dart';

import '../../../controller/Engineering Department/addreplycomplaint_controller.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../user/widget/addcomplaint/custombottomadd.dart';
import '../../user/widget/addcomplaint/customdropdownlist.dart';
import '../../user/widget/addcomplaint/customtitleaddcomplaint.dart';
import '../../user/widget/addcomplaint/customtitletextfield.dart';
import '../../user/widget/customappbaruser.dart';

class EngineerAddReplyComplaint extends StatelessWidget {
   EngineerAddReplyComplaint({super.key});
  final AddreplycomplaintController controller = Get.put(AddreplycomplaintController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarApp(title: "".tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Center(child: Customappbaruser(title: "Add replyComplaints".tr,)),
                SizedBox(height: 15.h),
                // Title
                Customtitleaddcomplaint(title: "Title".tr,),
                SizedBox(height: 15.h),
                Customtitletextfield(
                  controller: controller.titleController,
                  hint: "Enter title complaint here".tr,
                  icon: Icons.title,),

                SizedBox(height: 15.h),
                // Description
                Customtitleaddcomplaint(title: "Reply".tr,),
                SizedBox(height: 15.h),
                Customtitletextfield(
                    controller: controller.descriptionController,
                    hint: "reply to complaint here".tr,
                    icon: Icons.description,
                    maxLines: 4),

                SizedBox(height: 15.h),
                // Category Dropdown
                Customtitleaddcomplaint(title: "department".tr,),
                SizedBox(height: 15.h),
                CustomDropdown(
                  items: controller.categories,
                  selectedItem: controller.selectedCategory,
                  hint: "Select department".tr,
                  icon: Icons.category,),
                SizedBox(height: 15.h),
                // Location Dropdown
                SizedBox(height: 15.h),

                SizedBox(height: 20.h),
                // Submit Button
                Custombottomadd( text: "Submit".tr,onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.submitComplaint();
                  }} ),

                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
