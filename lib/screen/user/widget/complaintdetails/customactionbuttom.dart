import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../controller/user/setting_user_controller.dart';
import '../../../../core/constant/color.dart';

class ActionButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const ActionButtonWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
  //  final SettingsController controller = Get.put(SettingsController());
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: color, size: 30.sp),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.white,
              fontFamily: "cairo",fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
