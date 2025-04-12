import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../localization/changelocal.dart';


class AdminSectionCard extends StatelessWidget {
  final Map<String, dynamic> sectionData;

  const AdminSectionCard({Key? key, required this.sectionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(sectionData["route"]),
      child: GetBuilder<Localcontroller>(
        builder: (controllerloc) {
          return Card(
            color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
            elevation: 7,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
              side: BorderSide(
                color:  Colors.blue, // ✅ لون الإطار
                width: 2, // ✅ سمك الإطار
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    sectionData["icon"],
                    size: 50,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    sectionData["title"],
                    style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Appcolor.primarycolor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
