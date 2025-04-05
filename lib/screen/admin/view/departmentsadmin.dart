import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/data/dataScore/static/departmens.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/admin/departments_admin_controller.dart';
import '../widgets/departmentadmincard.dart';

class AdminDepartments extends StatelessWidget {
  const AdminDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DepartmentsadminControllerImp());
    return Scaffold(
        appBar: CustomAppBarApp(title: 'Departments'.tr),
        body: GetBuilder<DepartmentsadminControllerImp>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(14),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: departmentsData.length,
                itemBuilder: (context, index) => Departmentadmincard(
                      icon: departmentsData[index]["icon"]!,
                      name: departmentsData[index]["name"]!,
                      departmen: departmentsData[index]["department"]!,
                    )),
          ),
        ));
  }
}
