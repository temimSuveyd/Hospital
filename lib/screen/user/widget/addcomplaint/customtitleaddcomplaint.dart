import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class Customtitleaddcomplaint extends StatelessWidget {
  final String title;
  const Customtitleaddcomplaint({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Appcolor.primarycolor,fontFamily: "cairo"),
    );
  }
}
