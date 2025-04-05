import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: TextStyle(fontSize: 15.sp,fontFamily: "cairo",fontWeight: FontWeight.w600),),
      trailing: Icon(Icons.arrow_forward_ios, color: Appcolor.primarycolor),
      leading: Icon(icon, color: Appcolor.primarycolor),
      onTap: onTap,
    );
  }
}
