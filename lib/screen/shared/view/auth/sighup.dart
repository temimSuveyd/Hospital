import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbar.dart';

import '../../../../controller/auth/sigup_controller.dart';
import '../../../../core/functions/inputvaild.dart';
import '../../widgets/auth/CustomDropdownDepartment.dart';
import '../../widgets/auth/Customrowsighuporloginredirct.dart';
import '../../widgets/auth/curvePaintersighup.dart';
import '../../widgets/auth/custombottomauth.dart';
import '../../widgets/auth/customfieldauth.dart';
import '../../widgets/auth/customfieldpassword.dart';
import '../../widgets/auth/customtitleauth.dart';
import '../../widgets/customprofileimage.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => SignupControllerImp(),
    );
    return  GetBuilder<Localcontroller>(
        builder: (local_controller) => Scaffold(
         
              backgroundColor: local_controller.isDarkMode
                  ? Appcolor.colorcarddark
                  : Appcolor.white,
      body: GetBuilder<SignupControllerImp>(
        builder: (controller) => Handlingdataview(
            widget: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: CurvePainter(),
                      size: Size(double.infinity, 800.h),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 100.h),

                          Customtitleauth(title: "Sign Up".tr),
                          SizedBox(height: 10.h),

                          // 📸 صورة الملف الشخصي مع زر التحميل
                          ProfileImagePicker(
                            status: controller.image_isLoading,
                            image: controller.userImage ??
                                "https://th.bing.com/th/id/OIP.eMLmzmhAqRMxUZad3zXE5QHaHa?rs=1&pid=ImgDetMain&adlt=strict",
                            onTap: () {
                              controller.chooseImage();
                            },
                          ),
                          SizedBox(height: 15.h),
                          // 📝 اسم المستخدم
                          Customtextformauth(
                            labeltext: "Username".tr,
                            controller: controller.usernameController,
                            vaild: (val) => inputValid("text", 30, 5, val!),
                            isnumber: false,
                            icon: Icons.person,
                          ),
                          SizedBox(height: 7.h),

                          // 📧 البريد الإلكتروني
                          Customtextformauth(
                            icon: Icons.email,
                            labeltext: "email".tr,
                            controller: controller.emailController,
                            vaild: (val) => inputValid("email", 30, 5, val!),
                            isnumber: false,
                          ),
                          SizedBox(height: 7.h),

                          // 🔑 كلمة المرور
                          Obx(
                            () => Customfieldpassword(
                              onTapicon: () =>
                                  controller.togglePasswordVisibility(),
                              obscureText: !controller.isPasswordVisible.value,
                              labeltext: "password".tr,
                              icon: controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              controller: controller.passwordController,
                              vaild: (val) =>
                                  inputValid("password", 20, 8, val!),
                              isnumber: false,
                            ),
                          ),
                          SizedBox(height: 7.h),

                          // 📞 رقم الهاتف
                          Customtextformauth(
                            labeltext: "phone number".tr,
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
                                  labeltext: "Location".tr,
                                  controller: controller.locationController,
                                  vaild: (val) =>
                                      inputValid("text", 30, 5, val!),
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
                          SizedBox(height: 7.h),
                          SizedBox(height: 7.h),
                          // 🏢 القسم
                          CustomDropdownDepartment(
                            labeltext: "Department".tr,
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
                            labeltext: "Role".tr,
                            items: [
                              "User".tr,
                              "Engineer".tr,
                              "Contractor".tr,
                              "Admin".tr
                            ],
                            onChanged: (val) =>
                                controller.selectedRole.value = val!,
                          ),
                          SizedBox(height: 13.h),

                          // ✅ زر التسجيل
                          Custombottomauth(
                              text: "Sign Up".tr, onPressed: controller.signUp),
                          SizedBox(height: 15.h),

                          // 🔄 التحويل إلى صفحة تسجيل الدخول
                          Customrowsighuporloginredirct(
                            textone: "Already have an account? ".tr,
                            texttwo: "Sign In".tr,
                            ontap: () => Get.toNamed(Approutes.login),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            statusreqest: controller.statusreqest),),
      ),
    );
  }
}
