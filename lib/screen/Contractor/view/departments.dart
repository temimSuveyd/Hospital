import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';

import '../../../controller/Contractor/departmentcontactor_controller.dart';
import '../../user/widget/customappbaruser.dart';
import '../widget/departmentcard.dart';

class ContractorDepartments extends StatelessWidget {
  const ContractorDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الأقسام (يمكنك استبدالها ببيانات من API أو قاعدة بيانات)
    DepartmentcontactorController controller = Get.put(DepartmentcontactorController ());
    return Scaffold(
     appBar: CustomAppBarApp(title: ""),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h,vertical: 20.h),
        child: ListView(
          children: [
            SizedBox(height: 10.h,),
            Customappbaruser(title: 'Departments'.tr),
            SizedBox(height: 20.h,),
            ListView.builder(
              shrinkWrap: true,
              itemCount:controller. departments.length,
            itemBuilder: (context, index) => DepartmentCard(
            icon: controller.departments[index]["icon"]!,
            name: controller.departments[index]["name"]!,

            onTap: () {
             controller.gotoengineercontractor();
             Get.snackbar("معلومات", "تم اختيار ${controller.departments[index]["name"]}");
            },
            ))]),
      ))
  ;


  }
}
