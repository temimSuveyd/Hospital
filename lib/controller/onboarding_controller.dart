
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/Approutes.dart';
import '../data/dataScore/static/onboarding.dart';
import '../services/servieses.dart';

abstract class Onboardingcontroller extends GetxController{
  next();
  onpagechanged(int index);
  Skip();
}


class OnboardingcontrollerImp extends Onboardingcontroller {
  int currentpage = 0;
  late PageController pagecontroller;
  Services services = Get.find();

  @override
  next() {
    currentpage++;
    if (currentpage > onboardinglist.length - 1) {
      services.sharedPreferences.setString("step", "1");
      Get.offAllNamed(Approutes.login);
    } else {
      pagecontroller.animateToPage(
          currentpage, duration: Duration(microseconds: 900),
          curve: Curves.easeInOut);
    };
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  Skip() {
    pagecontroller.jumpToPage(onboardinglist.length - 1);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    pagecontroller = PageController();
  }

  skip() {
Get.toNamed(Approutes.login);

 }
}