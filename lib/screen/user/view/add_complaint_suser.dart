import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/user/add_complaint_controller.dart';
import '../widget/addcomplaint/custombottomadd.dart';
import '../widget/addcomplaint/customdropdownlist.dart';
import '../widget/addcomplaint/customtitleaddcomplaint.dart';
import '../widget/addcomplaint/customtitletextfield.dart';
import '../widget/customappbaruser.dart';

class UserAddcomplaint extends StatelessWidget {
  UserAddcomplaint({super.key});
  final AddComplaintControllerImp controller = Get.put(AddComplaintControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (local_controller) => 
       Scaffold(
        backgroundColor: local_controller.isDarkMode ? Appcolor.colorcarddark : Appcolor.white ,
        appBar: CustomAppBarApp(title: "Add Complaints".tr),
        body: GetBuilder<AddComplaintControllerImp>(
          builder: (controller) => Handlingdataview(widget:      Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 
                    // Title
                    Customtitleaddcomplaint(title: "Title".tr,),
                    SizedBox(height: 10.h),
                    Customtitletextfield(
                      controller: controller.titleController,
                      hint: "Enter title complaint here".tr,
                      icon: Icons.title,),
          
                    SizedBox(height: 10.h),
                    // Description
                    Customtitleaddcomplaint(title: "Description".tr,),
                    SizedBox(height: 10.h),
                    Customtitletextfield(
                        controller: controller.descriptionController,
                        hint: "Describe your complaint here".tr,
                        icon: Icons.description,
                        maxLines: 4),
          
                    SizedBox(height: 10.h),
                    // Category Dropdown
                    Customtitleaddcomplaint(title: "Departments".tr,),
                    SizedBox(height: 10.h),
                    CustomDropdown(
                      items: controller.categories,
                      selectedItem: controller.selectedCategory,
                      hint: "Select Departments".tr,
                      icon: Icons.category,),
                    SizedBox(height: 10.h),
          
                    SizedBox(height: 40.h),
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
          ), statusreqest: controller.statusreqest)
      
        ),
      ),
    );
  }
}
