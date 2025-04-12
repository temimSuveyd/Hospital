import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';

import '../../../controller/user/edit_profile_user_controller.dart';
import '../../../core/functions/inputvaild.dart';
import '../../shared/widgets/auth/CustomDropdownDepartment.dart';
import '../../shared/widgets/auth/custombottomauth.dart';
import '../../shared/widgets/auth/customfieldauth.dart';
import '../../shared/widgets/auth/customfieldpassword.dart';
import '../../shared/widgets/customprofileimage.dart';

class UserEditProfilePage extends StatelessWidget {
  const UserEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileUserControllerImp());
    return  GetBuilder<Localcontroller>(
        builder: (local_controller) => Scaffold(
          
              backgroundColor: local_controller.isDarkMode
                  ? Appcolor.colorcarddark
                  : Appcolor.white,
      appBar: AppBar(
        title: Text("Edit Profile".tr),
        backgroundColor: Appcolor.primarycolor,
      ),
      body: GetBuilder<EditProfileUserControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 📸 صورة الملف الشخصي مع زر التحميل
                    ProfileImagePicker(
                      status: false,
                      image: "controller.file.value",
                      onTap: controller.chooseImage,
                    ),

                    SizedBox(height: 15.h),

                    // 📝 اسم المستخدم
                    Customtextformauth(
                      labeltext: controller.userName??"",
                      controller: controller.usernameController,
                      vaild: (val) => inputValid("text", 30, 5, val!),
                      isnumber: false,
                      icon: Icons.person,
                    ),
                    SizedBox(height: 7.h),

                    // 📧 البريد الإلكتروني
                    Customtextformauth(
                      icon: Icons.email,
                      labeltext: controller.userEmail??"",
                      controller: controller.emailController,
                      vaild: (val) => inputValid("email", 30, 5, val!),
                      isnumber: false,
                    ),

                    SizedBox(height: 7.h),
                    // 📞 رقم الهاتف
                    Customtextformauth(
                      labeltext: controller.userPhone??"",
                      controller: controller.phoneNumberController,
                      vaild: (val) => inputValid("phone", 15, 10, val!),
                      isnumber: true,
                      icon: Icons.phone,
                    ),
                    SizedBox(height: 7.h),
                    // حقل الموقع مع زر تحديد الموقع
                    Row(
                      children: [
                        Expanded(
                          child: Customtextformauth(
                            labeltext: controller.userLocation??"",
                            controller: controller.locationController,
                            vaild: (val) => inputValid("text", 30, 5, val!),
                            isnumber: false,
                            icon: Icons.location_on,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.gotomap();
                          },
                          icon: Icon(
                            Icons.my_location,
                            color: Appcolor.primarycolor,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    // 🏢 القسم
                    CustomDropdownDepartment(
                      labeltext: controller.userDepartment??"",
                      items: [
                        "Electrical Engineering".tr,
                        "Mechanic Engineering".tr,
                        "Electronic Engineering (Low voltage)".tr,
                        "Civil Engineering".tr,
                      ],
                      onChanged: (val) =>
                          controller.selectedDepartment.value = val!,
                    ),
                    SizedBox(height: 10.h),

                    // 👤 الدور
                    CustomDropdownDepartment(
                      labeltext: controller.userRole??"",
                      items: [
                        "User".tr,
                        "Engineer".tr,
                        "Contractor".tr,
                        "Admin".tr
                      ],
                      onChanged: (val) => controller.selectedRole.value = val!,
                    ),
                    SizedBox(height: 13.h),

                    // ✅ زر الحفظ
                    Custombottomauth(
                        text: "Save Changes".tr,
                        onPressed: controller.updateProfile),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
              statusreqest: controller.statusreqest))),
    );
  }
}
