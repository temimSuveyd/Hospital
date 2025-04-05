import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';


class RememberPasswordButton extends StatelessWidget {
  final void Function()? onPressed;
  const RememberPasswordButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: GetBuilder<Localcontroller>(
          builder: ( controller) =>
          Text(
            "Remembered password? Sign in",
            style: TextStyle(
              color:controller.isDarkMode?Appcolor.white: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo",
            ),
          ),
        ),
      ),
    );
  }
}
