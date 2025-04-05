import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombuttomopenscreen extends StatelessWidget {
  final void Function()? onPressed;
  final String textbottom;
  const Custombuttomopenscreen({super.key, required this.onPressed, required this.textbottom});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
      child: Text(textbottom, style: TextStyle(color: Colors.blue, fontSize: 16.sp, fontWeight: FontWeight.bold,fontFamily: "cairo")),
    );
  }
}
