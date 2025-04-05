import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';

class Customtextlocation extends StatelessWidget {
  final String text;
  const Customtextlocation({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Location",
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Appcolor.primarycolor,
        fontFamily: "Cairo",
      ),
    );
  }
}
