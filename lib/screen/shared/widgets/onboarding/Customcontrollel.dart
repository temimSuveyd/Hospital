
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../controller/onboarding_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../data/dataScore/static/onboarding.dart';




class Customcontrolleronboarding extends StatelessWidget {
  const Customcontrolleronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnboardingcontrollerImp>(builder: (controller)=> SmoothPageIndicator(
      controller: controller.pagecontroller,
      count: onboardinglist.length,
      effect: ExpandingDotsEffect(
        activeDotColor: Appcolor.controllercolor ,
        dotColor: Colors.grey.shade300,
        dotHeight: 10,
        dotWidth: 8,
        spacing: 8,
      ),
    ),);
  }
}
