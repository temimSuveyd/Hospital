import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class Custombottomauth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Custombottomauth({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Appcolor.primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
        ),
        onPressed:onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo"
          ),
        ),
      ),
    );
  }
}
