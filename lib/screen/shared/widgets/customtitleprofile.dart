import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';

class Customtitleprofile extends StatelessWidget {
  final String text;
  const Customtitleprofile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color:Appcolor.primarycolor),
    );
  }
}
