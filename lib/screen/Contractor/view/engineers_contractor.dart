

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hosptail/screen/shared/widgets/customappbar.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';

import '../../../controller/Contractor/engineercontractor_controller.dart';
import '../../../controller/admin/engineer_admin_controller.dart';
import '../../../core/constant/color.dart';
import '../../user/widget/customappbaruser.dart';
import '../widget/engineercontractorcard.dart';


class ContractorEngineers extends StatelessWidget {
  final EngineercontractorController controller = Get.put(EngineercontractorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarApp(title: "") ,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h,vertical: 20.h),
        child: GetBuilder<EngineercontractorController>(
          builder: (controller) {
            return ListView(
              children: [
                SizedBox(height: 10.h,),
                Customappbaruser(title: 'Engineers '.tr),
                SizedBox(height: 20.h,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.engineers.length,
                  itemBuilder: (context, index) {
                    final engineer = controller.engineers[index];

                    return Engineercontractorcard(engineer: engineer ,);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
