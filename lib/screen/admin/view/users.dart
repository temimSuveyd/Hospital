import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/handlingDataView.dart';
import 'package:hosptail/data/model/users_model.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import '../../../controller/admin/usersadmin_controller.dart';
import '../../user/widget/customappbaruser.dart';
import '../widgets/usercardadmin.dart';

class AdminUsers extends StatelessWidget {
  const AdminUsers({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(UsersadminControllerImp());
    return Scaffold(
      appBar: CustomAppBarApp(
        title: 'Users'.tr,
      ),
      body: GetBuilder<UsersadminControllerImp>(
          builder: (controller) => Handlingdataview(
              widget: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.usersList.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                          userModel: UserModel.formateJson(
                              controller.usersList[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
              statusreqest: controller.statusreqest)),
    );
  }
}
