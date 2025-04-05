import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomPinCodeTextField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        controller: controller,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        pinTheme: PinTheme(

          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10.r),
          fieldHeight: 50.h,
          fieldWidth: 50.w,
          activeColor: Colors.blue,
          inactiveColor: Colors.blue,
          selectedColor: Colors.blue,
        ),
        onChanged: onChanged ?? (value) {},
        autoFocus: true,
      ),
    );
  }
}
