import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/Engineering Department/complaintreplys_controller.dart';
import '../../../controller/Engineering Department/homescreenengineer_controller.dart';
import '../../../data/dataScore/static/onboarding.dart';
import '../../shared/widgets/customappbar.dart';
import '../../shared/widgets/customappbarapp.dart';
import '../../user/widget/customappbaruser.dart';
import '../widget/complainteng/complaintcardeng.dart';
import '../widget/complaintreplys/Complaintreplyengcard.dart';

class EngineerComplaintReply extends StatelessWidget {
  const EngineerComplaintReply({super.key});

  @override
  Widget build(BuildContext context) {
    ComplaintreplysController controller = Get.put(ComplaintreplysController());
    return Scaffold(
        appBar:CustomAppBarApp(title: "".tr),
    body: Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: ListView(
        children: [
          SizedBox(height: 10.h,),
          Center(child: Customappbaruser(title: 'replys'.tr,)),

         ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              // itemCount: complaintsList.length,
              itemBuilder: (context, index) =>
                  Complaintreplyengcard(  controller:controller, index: index, complaintsList:[],),
            ),

        ],
      ),
    ));
  }
}
