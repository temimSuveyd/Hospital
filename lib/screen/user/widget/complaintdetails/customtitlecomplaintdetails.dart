import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class Customtitlecomplaintdetails extends StatelessWidget {
  final String text;
  const Customtitlecomplaintdetails({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Appcolor.primarycolor, fontFamily: "cairo"));
  }
}
