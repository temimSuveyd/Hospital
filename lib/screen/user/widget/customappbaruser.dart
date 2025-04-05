import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../controller/user/setting_user_controller.dart';
import '../../../core/constant/color.dart';

class Customappbaruser extends StatelessWidget {
  final String title;
  const Customappbaruser({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
   // final SettingsController controller = Get.put(SettingsController());
    return
       GetBuilder<Localcontroller>(
         builder: ( controller) =>
          Center(
            child: Text(title,
               textAlign: TextAlign.center,
               style: TextStyle(
               color:controller.isDarkMode?Appcolor.white:Appcolor.black, fontSize: 20.sp, fontWeight: FontWeight.bold,fontFamily: "cairo")),
          ),
       );
  }
}
