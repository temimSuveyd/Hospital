
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';



import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../widgets/onboarding/CustomBottomonboarding.dart';
import '../widgets/onboarding/Customcontrollel.dart';
import '../widgets/onboarding/onboardingcustomslider.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(OnboardingcontrollerImp());
    return
      Scaffold(
          body: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Appcolor.thirdcolor
              ),

              child: SafeArea(child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: OnboardingCustomSlider()
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [

                          Customcontrolleronboarding(),
                          Spacer(flex: 1,),
                          CustomBottomOnboarding()
                        ],
                      ))
                ],
              ))
          ) );
  }
}
