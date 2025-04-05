import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtitlecomplaints extends StatelessWidget {
  final String text;
  const Customtitlecomplaints({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          fontFamily: "Cairo"),
    );
  }
}
