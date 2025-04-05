import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onChanged;

  const RememberMeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        "Remember Me".tr,
        style: TextStyle(fontSize: 12.sp),
      ),
      value: value,
      onChanged: (val) {
        if (val != null) onChanged();
      },
      activeColor: Appcolor.primarycolor,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
