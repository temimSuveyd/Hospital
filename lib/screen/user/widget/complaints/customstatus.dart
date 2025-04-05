import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../core/constant/color.dart';

class Customstatus extends StatelessWidget {
  final String textone;
  final String texttwo;
  const Customstatus({super.key, required this.textone, required this.texttwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            textone,
            style: TextStyle(
                color: Appcolor.thirdcolor, fontSize: 13.sp, fontFamily: "Cairo",fontWeight: FontWeight.bold)
        ),
        SizedBox(width: 10,),
        GetBuilder<Localcontroller>(
          builder: ( controller) =>
           Text(
              texttwo,
              style: TextStyle(
                  color:controller.isDarkMode? Appcolor.textcolordark:Appcolor.textcolorlight, fontSize: 15.sp, fontFamily: "Cairo",fontWeight: FontWeight.bold)
          ),
        ),
      ],
    );
  }
}
