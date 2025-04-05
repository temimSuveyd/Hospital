import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';
import 'package:hosptail/screen/user/widget/custombottomdetails.dart';
import 'package:hosptail/screen/user/widget/homepageuser/customtitlecard.dart';
import '../../../../controller/Engineering Department/homepageengineer_controller.dart';
import '../../../../core/constant/color.dart';

class PageCardengineer extends GetView<HomepageengineerControllerImp> {
  final String title;
  final VoidCallback onTap;

  const PageCardengineer({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GetBuilder<Localcontroller>(
        builder: (controller) => Card(
          margin: EdgeInsets.only(bottom: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(
              color: controller.isDarkMode ? Appcolor.primarycolor: Appcolor.primarycolor, // ✅ لون الإطار
              width: 2, // ✅ سمك الإطار
            ),
          ),
          elevation: 6,
          color: controller.isDarkMode ? Appcolor.colorbackground: Colors.white,
          shadowColor: Colors.grey.shade300,
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ عنوان الكارت
                Customtitlecard(title: title),
                SizedBox(height: 8.h),

                // ✅ عرض التصنيف (غير مستخدم حاليًا)
                // _buildRow(icon: Icons.category, text: category, color: Colors.blueGrey),

                SizedBox(height: 5.h),

                // ✅ عرض الحالة (غير مستخدم حاليًا)
                // _buildRow(icon: Icons.timer, text: status, color: Appcolor.primarycolor),

                SizedBox(height: 10.h),

                // ✅ زر التفاصيل
                Align(
                  alignment: Alignment.centerRight,
                  child: Custombottomdetails(onPressed: onTap),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ دالة لإنشاء صف مع أيقونة ونص (جاهزة للاستخدام عند الحاجة)
  Widget _buildRow({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20.w),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: color),
        ),
      ],
    );
  }
}
