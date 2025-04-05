import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptail/core/constant/color.dart';

class ProfileImagePicker extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  final bool  status ;

  const ProfileImagePicker({super.key, required this.image, required this.onTap, required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          status ?
       CircularProgressIndicator(color: Appcolor.primarycolor,) :   CircleAvatar(
            radius: 50.r,
            backgroundImage: NetworkImage(image),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // خلفية بيضاء للأيقونة
              ),
              child: const Icon(Icons.camera_alt, size: 25, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
