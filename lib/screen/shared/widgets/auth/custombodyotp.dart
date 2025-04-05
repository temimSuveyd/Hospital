import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombodyotp extends StatelessWidget {
 final String title;
  const Custombodyotp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title
         ,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
