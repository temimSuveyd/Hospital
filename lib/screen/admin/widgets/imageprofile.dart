import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Imageprofile extends StatelessWidget {
 final String path;
  const Imageprofile({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26,
              blurRadius: 10.r,
              spreadRadius: 2.r),
        ],
      ),
      child: CircleAvatar(
        radius: 55.r,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(path),
      ),
    );
  }
}
