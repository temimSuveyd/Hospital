import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import '../../../../../core/constant/color.dart';
import '../../../../controller/user/home_screen_user_controller.dart';
import '../../../../controller/user/setting_user_controller.dart';
import 'custombottomappbar.dart';

class Customnavigatorbottombar extends StatelessWidget {
  const Customnavigatorbottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller) => GetBuilder<Localcontroller>(
        builder: (local_controller) => BottomAppBar(
          elevation: 20,
          color: local_controller.isDarkMode
              ? Appcolor.colorcarddark
              : Appcolor.white,
          shape: const CircularNotchedRectangle(),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Appcolor.primarycolor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20.r,
                  spreadRadius: 5.r,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                controller.pages.length,
                (index) {
                  bool isSelected = controller.currentpage == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.changepage(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.symmetric(
                            vertical: 3.h, horizontal: 3.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? local_controller.isDarkMode ? Appcolor.colorcarddark : Appcolor.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Custombottomappbar(
                          text: controller.namepage[index]["title"],
                          icon: controller.namepage[index]["icon"],
                          onPressed: () {
                            controller.changepage(index);
                          },
                          colorselecteditem: isSelected
                              ? Appcolor.primarycolor
                              : Appcolor.black,
                          colortext: isSelected
                              ? Appcolor.primarycolor
                              : Appcolor.colorbackground,
                          active: isSelected,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
