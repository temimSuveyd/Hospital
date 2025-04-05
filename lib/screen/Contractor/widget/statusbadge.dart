import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color:getStatusColor( status),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          status.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: "Cairo",
          ),
        ),
      ),
    );
  }

  // دالة تحديد لون الحالة
  // دالة لتحديد لون الحالة
  Color getStatusColor(String status) {
    if (status == "New".tr) {
      return Colors.red.shade300;
    } else if (status == "in_progress".tr) {
      return Colors.orange.shade300;
    } else if (status == "completed".tr) {
      return Colors.green.shade300;
    } else {
      return Colors.blueGrey;
    }
  }
}
