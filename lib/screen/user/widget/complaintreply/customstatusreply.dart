import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class Customstatusreply extends StatelessWidget {
  final String text;
   Customstatusreply({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
      "${'status'.tr} : ${text}",
      style: TextStyle(
        fontFamily: "Cairo",
        fontSize: 14.sp,
        fontWeight:FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }
}
