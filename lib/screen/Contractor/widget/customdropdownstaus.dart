import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/Contractor/addnotifcationcontroller.dart';

class CustomStatusDropdown extends StatelessWidget {
  final AddNotificationController controller;

  const CustomStatusDropdown({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: (controllerloc) => DropdownButtonFormField<String>(
        value: controller.status.value,
        items: [
          _buildDropdownItem('new'),
          _buildDropdownItem('in_progress'),
          _buildDropdownItem('completed'),
        ],
        onChanged: (value) => controller.status.value = value!,
        decoration: InputDecoration(
          labelText: 'notification_status'.tr,
          labelStyle: TextStyle(
            fontFamily: 'Cairo',
            color: controllerloc.isDarkMode ? Appcolor.white: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(Icons.flag, color: Appcolor.primarycolor),
          filled: true,
          fillColor:   controllerloc.isDarkMode ? Appcolor.colorbackground: Colors.white,
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(width: 2),
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        value.tr,
        style: TextStyle(
          fontFamily: 'Cairo',
          color: Appcolor.primarycolor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder({double width = 2}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolor.primarycolor, width: width),
    );
  }
}
