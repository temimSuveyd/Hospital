import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/admin/homepageadmin_controller.dart';
import '../../Contractor/widget/profileheader.dart';
import '../widgets/adminsectioncard.dart';

class AdminhomePage extends StatelessWidget {
  const AdminhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomepageadminControllerImp>(
        builder: (controller) => Padding(
          padding: EdgeInsets.only(top: 40.h, left: 10.w, right: 10.w),
          child: Column(
            children: [
              // ✅ صورة الملف الشخصي للمشرف ✅
              ProfileHeader(
                  path: "asset/images/avatar.png", text: 'Hi, Admin'.tr),

              SizedBox(height: 20.h),

              // ✅ عرض الأقسام باستخدام GridView ✅
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد الأعمدة
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 1.2, // نسبة العرض إلى الارتفاع
                  ),
                  itemCount: controller.adminSections.length,
                  itemBuilder: (context, index) {
                    return AdminSectionCard(
                      sectionData: controller.adminSections[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
