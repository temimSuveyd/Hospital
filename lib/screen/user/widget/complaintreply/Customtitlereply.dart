import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class Customtitlereply extends StatelessWidget {
  final String text;
  const Customtitlereply({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
      "${'Department'.tr} : ${text}",
      style: TextStyle(
        fontFamily: "Cairo",
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Appcolor.thirdcolor,
      ),
    );
  }
}
