import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Customforgrttext extends StatelessWidget {
  final void Function()? ontap;
  final String text;
  const Customforgrttext({super.key, this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: ontap,
          child: Text(
            text, // ✅ ترجمة "نسيت كلمة المرور؟"
            textAlign: TextAlign.end,
            style:  TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
