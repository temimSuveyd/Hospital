import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResendCodeText extends StatelessWidget {
  final bool isResending;
  final int resendTime;

  const ResendCodeText({
    Key? key,
    required this.isResending,
    required this.resendTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        isResending ? "Resend code".tr : "We will resend the code in $resendTime s".tr,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
