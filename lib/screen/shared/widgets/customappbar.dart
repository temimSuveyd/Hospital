import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../controller/user/setting_user_controller.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int count; // عدد العناصر

  const Customappbar({
    super.key,
    required this.title,
    this.count = 0, // القيمة الافتراضية هي 0
  });

  @override
  Widget build(BuildContext context) {
    //final SettingsController controller = Get.put(SettingsController());

    return AppBar(
      backgroundColor:  Appcolor.primarycolor,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.
            white ,
            fontSize: 20.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
