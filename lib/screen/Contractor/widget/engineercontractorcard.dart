import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/localization/changelocal.dart';


class Engineercontractorcard extends StatelessWidget {
  final Map<String, String> engineer;

  const Engineercontractorcard({Key? key, required this.engineer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>(
      builder: ( controllerloc) =>
          Card(
            shadowColor: Colors.blue.shade300,
            elevation: 6,
            color:controllerloc.isDarkMode?Appcolor.colorbackground:Colors.white,
            margin: EdgeInsets.only(bottom: 15.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
              side: BorderSide(
                color: controllerloc.isDarkMode ? Colors.blue : Appcolor.primarycolor, // ✅ لون الإطار
                width: 2, // ✅ سمك الإطار
              ),
            ),

            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(engineer["image"]!),
              ),
              title: Text(
                engineer["name"]!,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  color:controllerloc.isDarkMode? Appcolor.white: Appcolor.black,
                ),
              ),
              subtitle: Text(
                engineer["details"]!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Appcolor.thirdcolor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                Get.toNamed(Approutes.contractorComplaints, arguments: engineer);
              },
            ),
          ),
    );
  }
}
