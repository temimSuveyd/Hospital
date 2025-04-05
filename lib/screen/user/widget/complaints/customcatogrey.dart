import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/constant/color.dart';
import '../../../../localization/changelocal.dart';

class Customcatogrey extends StatelessWidget {
  final String textone;
  final String texttwo;
  const Customcatogrey({super.key, required this.textone, required this.texttwo});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            textone,
            style: TextStyle(
                color: Appcolor.thirdcolor, fontSize: 12.sp, fontFamily: "Cairo",fontWeight: FontWeight.bold)
        ),
        SizedBox(width: 10,),

    GetBuilder<Localcontroller>(
    builder: ( controller) =>  Text(
            texttwo,
            style: TextStyle(
                color:controller.isDarkMode? Appcolor.textcolordark:Appcolor.textcolorlight, fontSize: 12.sp, fontFamily: "Cairo",fontWeight: FontWeight.bold)
        )),
      ],
    );;
  }
}
