import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../controller/user/setting_user_controller.dart';
import '../../../../core/constant/color.dart';

class Complaintsdescription extends StatelessWidget {
  final String text;
  const  Complaintsdescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
   // final SettingsController controller = Get.put(SettingsController());
    return GetBuilder<Localcontroller>(
      builder: ( controller) =>
      Text(
          text,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600,
              color:controller.isDarkMode? Colors.white:Colors.black ,
              fontFamily: "cairo")),
    );
  }
}
