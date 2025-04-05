import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/controller/admin/contractoradmin_controller.dart';
import 'package:hosptail/data/model/users_model.dart';

import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';

class ContractorCard extends GetView<ContractoradminControllerImp> {
  final UserModel userModel;

  const ContractorCard({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
        builder: (controllerloc) => Card(
              color: controllerloc.isDarkMode
                  ? Appcolor.colorbackground
                  : Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
                side: BorderSide(
                  color: Colors.blue, // ✅ لون الإطار
                  width: 2, // ✅ سمك الإطار
                ),
              ),
              elevation: 3,
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  radius: 30,
                  // add user image in here
                  // backgroundImage: AssetImage(contractor["image"]!),
                ),
                title: Text(
              userModel.userName!,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                    color: controllerloc.isDarkMode
                        ? Appcolor.white
                        : Appcolor.black,
                  ),
                ),
                subtitle: Text(
                userModel.userPhone!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Appcolor.thirdcolor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                  ),
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                onTap: () {
       controller.goToContactorComplaint(userModel.userUid!,userModel.userRole!);
                },
              ),
            ));
  }
}
