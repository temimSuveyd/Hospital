import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';

class Customemailprofile extends StatelessWidget {
  final String email;
  const Customemailprofile({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return  Text(
     email,
      style: TextStyle(fontSize: 16.sp, color: Colors.grey,fontFamily: "cairo",fontWeight: FontWeight.bold),
    );
  }
}
