
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';


class Custombottomappbar extends StatelessWidget {
  final void Function()? onPressed;
  final String  text;
  final  IconData icon;
  final  Color?colorselecteditem;
  final  Color?colortext;
  final bool active;
  Custombottomappbar({super.key, this.onPressed, required this.text, required this.icon, this.colorselecteditem, this.colortext, required this.active});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed:onPressed,child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: Icon(icon,color:active==true? Appcolor.primarycolor: colorselecteditem)),
        SizedBox(height: 5.h,),
        Expanded(child: Text(text,style: TextStyle(color: active==true? Appcolor.primarycolor: colortext,fontSize:14.sp ,fontWeight: FontWeight.bold),))
      ],),);
  }
}
