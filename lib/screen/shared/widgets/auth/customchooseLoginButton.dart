import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomchooseLoginButton extends StatelessWidget {
  final String title;
  final Color color;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomchooseLoginButton({
    super.key,
    required this.title,
    required this.color,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      height: 60.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      color: color,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white, size: 24.sp),
            SizedBox(width: 10.w),
          ],
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
            ),
          ),
        ],
      ),
    );
  }
}
